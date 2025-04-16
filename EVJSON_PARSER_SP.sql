CREATE OR REPLACE PROCEDURE EVPOPULATION.RAWDATA.EVJSON_PARSER()
RETURNS VARCHAR
LANGUAGE PYTHON
RUNTIME_VERSION = '3.11'
PACKAGES = ('snowflake-snowpark-python')
HANDLER = 'main'
EXECUTE AS OWNER
AS '# The Snowpark package is required for Python Worksheets. 
# You can add more packages by selecting them using the Packages control and then importing them.

import snowflake.snowpark as snowpark
from snowflake.snowpark.functions import col

def main(session: snowpark.Session): 
    # Your code goes here, inside the "main" handler.
    tableName = ''EVPOPULATION.RAWDATA.EV_JSON_CONFIG''
    EV_JSON_CONFIG_DF = session.table(tableName).select(''JSON_FLD_NAME'' ,''JSON_DATA_TYPE'',''COL_POSITION'').rename(col(''JSON_FLD_NAME''),''FIELDNAME'').rename(col(''JSON_DATA_TYPE''),''DATATYPENAME'').rename(col(''COL_POSITION''),''POS_NO'')
    print("EV_JSON_CONFIG_DF")
    EV_JSON_CONFIG_DF.show(50)
    # Print a sample of the dataframe to standard output.
    #EV_JSON_CONFIG_DF.show()
#where POS_NO <=5 order by pos_no
    JSON_RW_DF = session.sql("select TRIM(VALUE:fieldName::String,'':@'') as fieldName,TRIM(VALUE:dataTypeName::String,'':@'') as dataTypeName,TRIM(VALUE:position::String,'':@'') as pos_no from EVPOPULATION.RAWDATA.EV_DATA_RW, Lateral FLATTEN (input => json_ev_data:meta.view.columns) ")
    print("JSON_RW_DF")
    JSON_RW_DF.show(50)
    JSON_RW_DF.subtract(EV_JSON_CONFIG_DF).show()
    
    #snowpark.testing.assert_dataframe_equal(EV_JSON_CONFIG_DF,JSON_RW_DF)
    # Return value will appear in the Results tab.

    count = JSON_RW_DF.subtract(EV_JSON_CONFIG_DF).count()
    flag = 0
    status = "Fail"
    if count == 0:
        df1 = session.sql("insert into EVPOPULATION.RAWDATA.JSON_META_CONFIG_DM_RW select TRIM(VALUE[0]) as sid, TRIM(VALUE[1]) as id, TRIM(VALUE[2]) as pos, TRY_TO_DATE(TRIM(VALUE[3])) as created_at,TRIM(VALUE[4]) as created_meta, TRY_TO_DATE(TRIM(VALUE[5])) as updated_at, TRIM(VALUE[6]) as updated_meta, TRIM(VALUE[7]) as meta from EVPOPULATION.RAWDATA.EV_DATA_RW, Lateral FLATTEN (input => json_ev_data:data);")
        df1.show()
        dynamic_qry = ""
        df2 = session.sql("select Col_Name,col_position from EVPOPULATION.RAWDATA.EV_JSON_CONFIG where is_meta = false").collect()
      
        #myslist = df2.collect()
        s = "insert into EVPOPULATION.RAWDATA.JSON_DATA_PARSED_FT_RW select "
        print(df2)
        for row in df2:
            s = s + " TRIM(VALUE[" + str(int(row[1])+7) + "]) as " + row[0] + ","
            
        if s.endswith(","):
            s = s[:-1]
        s = s+ " from EVPOPULATION.RAWDATA.EV_DATA_RW, Lateral FLATTEN (input => json_ev_data:data) "
        print(s)
        df2 = session.sql(s).collect()
        status ="Success"
        
    else: 
        flag = 1
    
    #print("count:" count)    
    return status';