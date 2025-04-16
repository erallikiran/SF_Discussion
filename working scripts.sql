

select * from EV_JSON_CONFIG;

insert into EV_JSON_CONFIG values('v1','id','meta_data','EVPOPULATION','RAWDATA','JSON_META_CONFIG','ID',true,'This the id field',0);
insert into EV_JSON_CONFIG values('v1','sid','meta_data','EVPOPULATION','RAWDATA','JSON_META_CONFIG','SID',true,'This the sid field',0);
insert into EV_JSON_CONFIG values('v1','meta','meta_data','EVPOPULATION','RAWDATA','JSON_META_CONFIG','META',true,'This the META field',0);
insert into EV_JSON_CONFIG values('v1','updated_meta','meta_data','EVPOPULATION','RAWDATA','JSON_META_CONFIG','UPDATED_META',true,'This the updated_meta field',0);
insert into EV_JSON_CONFIG values('v1','updated_at','meta_data','EVPOPULATION','RAWDATA','JSON_META_CONFIG','UPDATED_AT',true,'This the id field',0);
insert into EV_JSON_CONFIG values('v1','created_meta','meta_data','EVPOPULATION','RAWDATA','JSON_META_CONFIG','CREATED_META',true,'This the id field',0);
insert into EV_JSON_CONFIG values('v1','created_at','meta_data','EVPOPULATION','RAWDATA','JSON_META_CONFIG','CREATED_AT',true,'This the id field',0);
insert into EV_JSON_CONFIG values('v1','position','meta_data','EVPOPULATION','RAWDATA','JSON_META_CONFIG','POS',true,'This the id field',0);

select * from EV_JSON_CONFIG;
delete from EV_JSON_CONFIG;



select * from EV_JSON_CONFIG;

insert into EV_JSON_CONFIG values('v1','vin_1_10','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','VIN_NO',false,'The 1st 10 characters of each vehicles Vehicle Identification Number (VIN)',1);

insert into EV_JSON_CONFIG values('v1','County','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','COUNTRY',false,'The county in which the registered owner resides.',2);

insert into EV_JSON_CONFIG values('v1','City','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','CITY',false,'The city in which the registered owner resides.',3);

insert into EV_JSON_CONFIG values('v1','State','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','STATE',false,'The state in which the registered owner resides.',4);

insert into EV_JSON_CONFIG values('v1','zip_code','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','ZIP_CODE',false,'The 5 digit zip code in which the registered owner resides.',5);

insert into EV_JSON_CONFIG values('v1','model_year','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','MODEL_YR',false,'The model year of the vehicle, determined by decoding the Vehicle Identification Number (VIN)',6);

insert into EV_JSON_CONFIG values('v1','make','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','MAKE',false,'The manufacturer of the vehicle, determined by decoding the Vehicle Identification Number (VIN)',7);

insert into EV_JSON_CONFIG values('v1','model','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','MODEL',false,'The model of the vehicle, determined by decoding the Vehicle Identification Number (VIN)',8);

insert into EV_JSON_CONFIG values('v1','ev_type','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','EV_TYPE',false,'Electric Vehicle Type',9);

insert into EV_JSON_CONFIG values('v1','cafv_type','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','CAFV_TYPE',false,'This categorizes vehicle as Clean Alternative Fuel Vehicles (CAFVs) based on the fuel requirement and electric-only range requirement in House Bill 2042 as passed in the 2019 legislative session',10);

insert into EV_JSON_CONFIG values('v1','electric_range','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','ELECTRIC_RANGE',false,'Describes how far a vehicle can travel purely on its electric charge',11);

insert into EV_JSON_CONFIG values('v1','base_msrp','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','BASE_MSP',false,'This is the lowest Manufacturers Suggested Retail Price (MSRP) for any trim level of the model in question',12);

insert into EV_JSON_CONFIG values('v1','legislative_district','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','LEGISLATIVE_DISTRICT',false,'The specific section of Washington State that the vehicles owner resides in, as represented in the state legislature',13);

insert into EV_JSON_CONFIG values('v1','dol_vehicle_id','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','DOL_VEHICLE_ID',false,'The specific section of Washington State that the vehicles owner resides in, as represented in the state legislature',14);

insert into EV_JSON_CONFIG values('v1','geocoded_column','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','GEOCODED_COLUMN',false,'The center of the ZIP Code for the registered vehicle',15);

insert into EV_JSON_CONFIG values('v1','electric_utility','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','ELECTRICITY_UTILITY',false,'This is ELECTRICITY_UTILITY description',17);

insert into EV_JSON_CONFIG values('v1','_2020_census_tract','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','CENSUS_TRACT_2020',false,'This is census tract description',18);

insert into EV_JSON_CONFIG values('v1','computed_region_x4ys_rtnd','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','COMPUTED_REGION', false,'This is COMPUTED_REGION description',19);

insert into EV_JSON_CONFIG values('v1','computed_region_fny7_vc3j','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','COMPUTED_REGION_2', false,'This is COMPUTED_REGION_2 description',20);

insert into EV_JSON_CONFIG values('v1','computed_region_8ddd_yn5v','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','COMPUTED_REGION_3', false,'This is COMPUTED_REGION_2 description',21);

select * from EV_JSON_CONFIG;



CREATE OR REPLACE STAGE EVPOPULATION.RAWDATA.EV_DATA_STG
FILE_FORMAT = (TYPE = 'json' );

SELECT TO_DATE('1676414233','YYYY-MM-DD') FROM DUAL;

select TRY_TO_DATE('1676414233') as date1;

show stages;    

LIST @EVPOPULATION.RAWDATA.EV_DATA_STG;

Copy into EVPOPULATION.RAWDATA.EV_DATA_RW from @ev_data_stg/ElectricVehiclePopulationData.json.gz;

select json_ev_data:meta,json_ev_data:data from EV_DATA_RW;

SELECT * FROM TABLE(FLATTEN(json_ev_data => PARSE_JSON(json_ev_data))) f;

select json_ev_data:meta from EV_DATA_RW;

select VALUE:fieldName::String from EV_DATA_RW, Lateral FLATTEN (input => json_ev_data:meta.view.columns) limit 28;

select TRIM(VALUE:fieldName::String,':@') as fieldName,
TRIM(VALUE:dataTypeName::String,':@') as dataTypeName,
TRIM(VALUE:description::String,':@') as description,
TRIM(VALUE:position::String,':@') as pos_no
--TRIM(VALUE:description::String,':@') as description,

from EV_DATA_RW, Lateral FLATTEN (input => json_ev_data:meta.view.columns) order by pos_no;


select TRIM(VALUE:fieldName::String,':@') as fieldName,
TRIM(VALUE:dataTypeName::String,':@') as dataTypeName,
TRIM(VALUE:position::String,':@') as pos_no
from EV_DATA_RW, Lateral FLATTEN (input => json_ev_data:meta.view.columns) order by pos_no;

describe table EV_JSON_CONFIG;

select * from EV_JSON_CONFIG;

select TRIM(VALUE[0]) as sid, TRIM(VALUE[1]) as id, TRIM(VALUE[2]) as pos, TRY_TO_DATE(TRIM(VALUE[3])) as created_at,
TRIM(VALUE[4]) as created_meta, TRY_TO_DATE(TRIM(VALUE[5])) as updated_at, TRIM(VALUE[6]) as updated_meta, 
TRIM(VALUE[6]) as meta
from EV_DATA_RW, Lateral FLATTEN (input => json_ev_data:data) limit 5;


insert into JSON_META_CONFIG_DM select TRIM(VALUE[0]) as sid, TRIM(VALUE[1]) as id, TRIM(VALUE[2]) as pos, TRY_TO_DATE(TRIM(VALUE[3])) as created_at,
TRIM(VALUE[4]) as created_meta, TRY_TO_DATE(TRIM(VALUE[5])) as updated_at, TRIM(VALUE[6]) as updated_meta, 
TRIM(VALUE[6]) as meta
from EV_DATA_RW, Lateral FLATTEN (input => json_ev_data:data) limit 5;


select * from 

select * from JSON_META_CONFIG_DM;
delete from JSON_META_CONFIG_DM;

--insert into JSON_DATA_PARSED_FT

select TRIM(VALUE[(select col_position from EV_JSON_CONFIG where JSON_SRC_TAG = ('vin_1_10'))+7]) as VIN_NO
from EV_DATA_RW, Lateral FLATTEN (input => json_ev_data:data) limit 5;

value(post+7) as json_src_tag

select JSON_SRC_TAG,col_position from EV_JSON_CONFIG where is_meta = false;

-- generated sql from snowpark -- 
select  TRIM(VALUE[8]) as vin_1_10, TRIM(VALUE[9]) as county, TRIM(VALUE[10]) as city, TRIM(VALUE[11]) as state, TRIM(VALUE[12]) as zip_code, TRIM(VALUE[13]) as model_year, TRIM(VALUE[14]) as make
from EV_DATA_RW, Lateral FLATTEN (input => json_ev_data:data) limit 5;





insert into JSON_DATA_PARSED_FT select  TRIM(VALUE[8]) as VIN_NO, TRIM(VALUE[9]) as COUNTRY, TRIM(VALUE[10]) as CITY, TRIM(VALUE[11]) as STATE, TRIM(VALUE[12]) as ZIP_CODE, TRIM(VALUE[13]) as MODEL_YR, TRIM(VALUE[14]) as MAKE, TRIM(VALUE[15]) as MODEL, TRIM(VALUE[16]) as EV_TYPE, TRIM(VALUE[17]) as CAFV_TYPE, TRIM(VALUE[18]) as ELECTRIC_RANGE, TRIM(VALUE[19]) as BASE_MSP, TRIM(VALUE[20]) as LEGISLATIVE_DISTRICT, TRIM(VALUE[21]) as DOL_VEHICLE_ID, TRIM(VALUE[22]) as GEOCODED_COLUMN, TRIM(VALUE[24]) as ELECTRICITY_UTILITY, TRIM(VALUE[25]) as CENSUS_TRACT_2020, TRIM(VALUE[26]) as COMPUTED_REGION, TRIM(VALUE[27]) as COMPUTED_REGION_2, TRIM(VALUE[28]) as COMPUTED_REGION_3
from EV_DATA_RW, Lateral FLATTEN (input => json_ev_data:data) limit 5;

insert into JSON_DATA_PARSED_FT_RW select  TRIM(VALUE[8]) as VIN_NO, TRIM(VALUE[9]) as COUNTRY, TRIM(VALUE[10]) as CITY, TRIM(VALUE[11]) as STATE, TRIM(VALUE[12]) as ZIP_CODE, TRIM(VALUE[13]) as MODEL_YR, TRIM(VALUE[14]) as MAKE, TRIM(VALUE[15]) as MODEL, TRIM(VALUE[16]) as EV_TYPE, TRIM(VALUE[17]) as CAFV_TYPE, TRIM(VALUE[18]) as ELECTRIC_RANGE, TRIM(VALUE[19]) as BASE_MSP, TRIM(VALUE[20]) as LEGISLATIVE_DISTRICT, TRIM(VALUE[21]) as DOL_VEHICLE_ID, TRIM(VALUE[22]) as GEOCODED_COLUMN, TRIM(VALUE[24]) as ELECTRICITY_UTILITY, TRIM(VALUE[25]) as CENSUS_TRACT_2020, TRIM(VALUE[26]) as COMPUTED_REGION, TRIM(VALUE[27]) as COMPUTED_REGION_2, TRIM(VALUE[28]) as COMPUTED_REGION_3 from EV_DATA_RW, Lateral FLATTEN (input => json_ev_data:data) limit 5;

select * from JSON_META_CONFIG_DM;
ALTER DYNAMIC TABLE JSON_META_CONFIG_DM REFRESH;
select * from JSON_META_CONFIG_DM_RW limit 50;

select count(1) from JSON_DATA_PARSED_FT_RW;


ALTER DYNAMIC TABLE JSON_DATA_PARSED_FT REFRESH;
select * from JSON_DATA_PARSED_FT_RW limit 50;
select * from JSON_DATA_PARSED_FT;

delete from JSON_DATA_PARSED_FT_RW;


SELECT
  DISTINCT VALUE AS field_name
FROM
  ev_data_rw,
  LATERAL FLATTEN (OBJECT_KEYS (json_ev_data:meta.view.columns)) AS key (SEQ, KEY, PATH, INDEX, VALUE, THIS); 

drop table EV_DATA_RW;

select * from EV_JSON_CONFIG;
select * from EVPOPULATION.RAWDATA.EV_JSON_CONFIG;

insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','legislative_district','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','LEGISLATIVE_DISTRICT',false,'The specific section of Washington State that the vehicles owner resides in, as represented in the state legislature',13);

delete from EVPOPULATION.RAWDATA.EV_JSON_CONFIG where JSON_FLD_NAME='legislative_district';

select TRIM(VALUE:fieldName::String,':@') as fieldName,TRIM(VALUE:dataTypeName::String,':@') as dataTypeName,TRIM(VALUE:position::String,':@') as pos_no from EVPOPULATION.RAWDATA.EV_DATA_RW, Lateral FLATTEN (input => json_ev_data:meta.view.columns);


-- Aggregate Insights --  EVPOPULATION.EV_CORE.JSON_META_CONFIG_DM , EVPOPULATION.EV_CORE.JSON_DATA_PARSED_FT

select distinct ev_type from EVPOPULATION.EV_CORE.JSON_DATA_PARSED_FT limit 10;

select count(MAKE) as Total_Cars,MAKE,CITY from EVPOPULATION.EV_CORE.JSON_DATA_PARSED_FT group by MAKE,CITY order by Total_Cars desc limit 10;

select * from EVPOPULATION.EV_RFND.EV_MK_MODEL_AGG;


select count(MAKE) as Total_Cars,MAKE,MODEL_YR from EVPOPULATION.EV_CORE.JSON_DATA_PARSED_FT group by MAKE,MODEL_YR order by Total_Cars desc limit 10;

CREATE OR REPLACE STAGE EVPOPULATION.EV_CORE.EV_CORTEX_STG;

CREATE OR REPLACE SEQUENCE MAKE_SEQ;





select MAKE,"M" + MAKE_SEQ.NEXTVAL as id, load_date from (select distinct MAKE, current_date() as load_date from EVPOPULATION.EV_CORE.JSON_DATA_PARSED_FT);

select * from EVPOPULATION.EV_CORE.JSON_DATA_PARSED_FT limit 10;


select count(EV_TYPE), EV_TYPE,MODEL_YR from EVPOPULATION.EV_CORE.JSON_DATA_PARSED_FT group by EV_TYPE, MODEL_YR;

select count(EV_TYPE) as Sales, EV_TYPE,CITY from EVPOPULATION.EV_CORE.JSON_DATA_PARSED_FT group by EV_TYPE, CITY;

Select snowflake.core.UNIQUE_COUNT( select VIN_NO from EVPOPULATION.EV_CORE.JSON_DATA_PARSED_FT);

Select snowflake.core.DUPLICATE_COUNT( select VIN_NO from EVPOPULATION.EV_CORE.JSON_DATA_PARSED_FT);

select * from TABLE(SYSTEM$DATA_METRIC_SCAN(REF_ENTITY_NAME='VIN_NO', METRIC_NAME = 'Snowflake.core.UNIQUE_COUNT'));

ALTER TABLE EVPOPULATION.EV_CORE.JSON_DATA_PARSED_FT SET
  DATA_METRIC_SCHEDULE = '5 MINUTE';

ALTER TABLE EVPOPULATION.EV_CORE.JSON_DATA_PARSED_FT
  ADD DATA METRIC FUNCTION SNOWFLAKE.CORE.DUPLICATE_COUNT
    ON (VIN_NO);

select * from SNOWFLAKE.LOCAL.DATA_QUALITY_MONITORING_RESULTS_RAW;

SELECT *
  FROM TABLE(
    INFORMATION_SCHEMA.DATA_METRIC_FUNCTION_REFERENCES(
      REF_ENTITY_NAME => 'EVPOPULATION.EV_CORE.JSON_DATA_PARSED_FT',
      REF_ENTITY_DOMAIN => 'table'
    )
  );
