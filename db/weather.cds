namespace difcore;


@assert.unique: {
  unique_skey: [ MANDT, MeasureName ]
}
entity MEASURE {

  key sKey         : UUID @odata.Type : 'Edm.String';
      MANDT        : String(3) not null;
      MeasureName  : String not null;
      Description  : String not null;
      
}


entity MEASURE_LOCATION_TIMESERIES {
  key MANDT              : String(3) not null;
  key WeatherStation     : UUID not null @odata.Type : 'Edm.String';
  key Measure            : UUID not null @odata.Type : 'Edm.String';
      MeasureRef         : Association[1] to MEASURE on MeasureRef.sKey = Measure;
  key LOG_SYS_ID         : String(5) not null;
  key LOC_TCD            : String(4) not null;
  key EXT_LOC_ID         : String(60) not null;
      DDF_Location       : Binary(16) not null @odata.Type : 'Edm.Binary';
      Entries            : Association[0.. *] to WEATHERFEED on Entries.WeatherStation = WeatherStation and Entries.Measure = Measure;
}

entity WEATHERFEED {
	key WeatherStation  : UUID @odata.Type : 'Edm.String' not null ;
  key Measure         : UUID  not null @odata.Type : 'Edm.String';
      MeasureRef      : Association[1] to MEASURE on MeasureRef.sKey = Measure;
	key Timestamp       : Timestamp not null;
    	Value           : Double not null;
}



//@assert.unique: {
//  unique_skey: [ Client, Name ]
//}
entity RULE_CONFIG {

  key sKey                    : UUID @odata.Type : 'Edm.String';

      Client                  : String(3) not null;
      Name                    : String(100) not null;
      Rule                    : String(1000) not null;
      Disabled                : Boolean not null default false;
      Granularity             : String(100) not null default 'DAY';
      TimeShift               : Integer not null default 0;
      PastHorizon             : Integer not null default 90;
      FutureHorizon           : Integer not null default 30;

      LocationHierarchyID     : String(10) not null default '0000000000';
      ProductHierarchyID      : String(10) not null default '0000000000';

      OrderChannelID          : String(2) not null default '00';
      SalesOrgID              : String(28) not null default '0000000000000000000000000000';
      
      @cascade: {delete}
      Aggregations            : Association[ * ] to RULE_CONFIG_AGGREGATIONS on Aggregations.DIFConfig = sKey;
      
      @cascade: {delete}
      Locations               : Association[ * ] to RULE_CONFIG_ASSIGNMENT_LOCATIONS on Locations.DIFConfig = sKey;
      
      @cascade: {delete}
      LocationNodes           : Association[ * ] to RULE_CONFIG_ASSIGNMENT_LOCATION_NODES on LocationNodes.DIFConfig = sKey;
      
      @cascade: {delete}
      Products               : Association[ * ] to RULE_CONFIG_ASSIGNMENT_PRODUCTS on Products.DIFConfig = sKey;
      
      @cascade: {delete}
      ProductNodes           : Association[ * ] to RULE_CONFIG_ASSIGNMENT_PRODUCT_NODES on ProductNodes.DIFConfig = sKey;
}

@assert.unique: {
  unique_skey: [ Client, DIFConfig, Measure ]
}
entity RULE_CONFIG_AGGREGATIONS {

  key sKey         : UUID          @odata.Type : 'Edm.String';

      Client       : String(3) not null;

      DIFConfig    : UUID not null @odata.Type : 'Edm.String';
      DIFConfigRef : Association[1] to RULE_CONFIG on DIFConfigRef.sKey = DIFConfig;

      Measure      : UUID not null @odata.Type : 'Edm.String';
      MeasureRef   : Association[1] to MEASURE on MeasureRef.sKey = Measure;

      Function     : String(100) not null;
}

@assert.unique: {
  unique_skey: [ Client, DIFConfig, DDF_Location ]
}
entity RULE_CONFIG_ASSIGNMENT_LOCATIONS {

  key sKey                            : UUID @odata.Type : 'Edm.String';

      Client                          : String(3) not null;

      DIFConfig                       : UUID not null @odata.Type : 'Edm.String';
      DIFConfigRef                    : Association[1] to RULE_CONFIG on DIFConfigRef.sKey = DIFConfig;

      DDF_Location                    : Binary(16) @odata.Type : 'Edm.Binary';
}

@assert.unique: {
  unique_skey: [ Client, DIFConfig, DDF_Location_Hierarchy_Node ]
}
entity RULE_CONFIG_ASSIGNMENT_LOCATION_NODES {

  key sKey                            : UUID @odata.Type : 'Edm.String';

      Client                          : String(3) not null;

      DIFConfig                       : UUID not null @odata.Type : 'Edm.String';
      DIFConfigRef                    : Association[1] to RULE_CONFIG on DIFConfigRef.sKey = DIFConfig;

      DDF_Location_Hierarchy_Node     : Binary(16) @odata.Type : 'Edm.Binary';
}

@assert.unique: {
  unique_skey: [ Client, DIFConfig, DDF_Product ]
}
entity RULE_CONFIG_ASSIGNMENT_PRODUCTS {

  key sKey                            : UUID @odata.Type : 'Edm.String';

      Client                          : String(3) not null;

      DIFConfig                       : UUID not null @odata.Type : 'Edm.String';
      DIFConfigRef                    : Association[1] to RULE_CONFIG on DIFConfigRef.sKey = DIFConfig;

      DDF_Product                    : Binary(16) @odata.Type : 'Edm.Binary';
}

@assert.unique: {
  unique_skey: [ Client, DIFConfig, DDF_Product_Hierarchy_Node ]
}
entity RULE_CONFIG_ASSIGNMENT_PRODUCT_NODES {

  key sKey                            : UUID @odata.Type : 'Edm.String';

      Client                          : String(3) not null;

      DIFConfig                       : UUID not null @odata.Type : 'Edm.String';
      DIFConfigRef                    : Association[1] to RULE_CONFIG on DIFConfigRef.sKey = DIFConfig;

      DDF_Product_Hierarchy_Node     : Binary(16) @odata.Type : 'Edm.Binary';
}
