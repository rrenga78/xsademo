using { difcore } from '../db/weather';

service WeatherService {

  entity Measure                          as projection on difcore.MEASURE;
  entity RuleConfig                       as projection on difcore.RULE_CONFIG;

  entity RuleConfigAssignmentsToLocations as projection on difcore.RULE_CONFIG_ASSIGNMENT_LOCATIONS;
  entity RuleConfigAssignmentsToLocationNodes as projection on difcore.RULE_CONFIG_ASSIGNMENT_LOCATION_NODES;
  entity RuleConfigAssignmentsToProducts as projection on difcore.RULE_CONFIG_ASSIGNMENT_PRODUCTS;
  entity RuleConfigAssignmentsToProductNodes as projection on difcore.RULE_CONFIG_ASSIGNMENT_PRODUCT_NODES;    

}

