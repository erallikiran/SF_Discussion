-- Configuration Information needed -- 

insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','id','meta_data','EVPOPULATION','RAWDATA','JSON_META_CONFIG','ID',true,'This the id field',0);
insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','sid','meta_data','EVPOPULATION','RAWDATA','JSON_META_CONFIG','SID',true,'This the sid field',0);
insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','meta','meta_data','EVPOPULATION','RAWDATA','JSON_META_CONFIG','META',true,'This the META field',0);
insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','updated_meta','meta_data','EVPOPULATION','RAWDATA','JSON_META_CONFIG','UPDATED_META',true,'This the updated_meta field',0);
insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','updated_at','meta_data','EVPOPULATION','RAWDATA','JSON_META_CONFIG','UPDATED_AT',true,'This the id field',0);
insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','created_meta','meta_data','EVPOPULATION','RAWDATA','JSON_META_CONFIG','CREATED_META',true,'This the id field',0);
insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','created_at','meta_data','EVPOPULATION','RAWDATA','JSON_META_CONFIG','CREATED_AT',true,'This the id field',0);
insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','position','meta_data','EVPOPULATION','RAWDATA','JSON_META_CONFIG','POS',true,'This the id field',0);

insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','vin_1_10','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','VIN_NO',false,'The 1st 10 characters of each vehicles Vehicle Identification Number (VIN)',1);

insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','county','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','COUNTRY',false,'The county in which the registered owner resides.',2);

insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','city','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','CITY',false,'The city in which the registered owner resides.',3);

insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','state','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','STATE',false,'The state in which the registered owner resides.',4);

insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','zip_code','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','ZIP_CODE',false,'The 5 digit zip code in which the registered owner resides.',5);

insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','model_year','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','MODEL_YR',false,'The model year of the vehicle, determined by decoding the Vehicle Identification Number (VIN)',6);

insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','make','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','MAKE',false,'The manufacturer of the vehicle, determined by decoding the Vehicle Identification Number (VIN)',7);

insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','model','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','MODEL',false,'The model of the vehicle, determined by decoding the Vehicle Identification Number (VIN)',8);

insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','ev_type','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','EV_TYPE',false,'Electric Vehicle Type',9);

insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','cafv_type','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','CAFV_TYPE',false,'This categorizes vehicle as Clean Alternative Fuel Vehicles (CAFVs) based on the fuel requirement and electric-only range requirement in House Bill 2042 as passed in the 2019 legislative session',10);

insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','electric_range','number','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','ELECTRIC_RANGE',false,'Describes how far a vehicle can travel purely on its electric charge',11);

insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','base_msrp','number','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','BASE_MSP',false,'This is the lowest Manufacturers Suggested Retail Price (MSRP) for any trim level of the model in question',12);

insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','legislative_district','number','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','LEGISLATIVE_DISTRICT',false,'The specific section of Washington State that the vehicles owner resides in, as represented in the state legislature',13);

insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','dol_vehicle_id','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','DOL_VEHICLE_ID',false,'The specific section of Washington State that the vehicles owner resides in, as represented in the state legislature',14);

insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','geocoded_column','point','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','GEOCODED_COLUMN',false,'The center of the ZIP Code for the registered vehicle',15);

insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','electric_utility','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','ELECTRICITY_UTILITY',false,'This is ELECTRICITY_UTILITY description',17);

insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','_2020_census_tract','text','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','CENSUS_TRACT_2020',false,'This is census tract description',18);

insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','computed_region_x4ys_rtnd','number','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','COMPUTED_REGION', false,'This is COMPUTED_REGION description',19);

insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','computed_region_fny7_vc3j','number','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','COMPUTED_REGION_2', false,'This is COMPUTED_REGION_2 description',20);

insert into EVPOPULATION.RAWDATA.EV_JSON_CONFIG values('v1','computed_region_8ddd_yn5v','number','EVPOPULATION','RAWDATA','JSON_DATA_PARSED','COMPUTED_REGION_3', false,'This is COMPUTED_REGION_2 description',21);

Copy into EVPOPULATION.RAWDATA.EV_DATA_RW from @ev_data_stg/ElectricVehiclePopulationData.json.gz;


--delete from EVPOPULATION.RAWDATA.EV_JSON_CONFIG;