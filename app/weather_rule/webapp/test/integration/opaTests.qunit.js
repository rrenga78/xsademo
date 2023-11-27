sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'weatherrule/test/integration/FirstJourney',
		'weatherrule/test/integration/pages/RuleConfigList',
		'weatherrule/test/integration/pages/RuleConfigObjectPage',
		'weatherrule/test/integration/pages/RuleConfigAssignmentsToLocationsObjectPage'
    ],
    function(JourneyRunner, opaJourney, RuleConfigList, RuleConfigObjectPage, RuleConfigAssignmentsToLocationsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('weatherrule') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheRuleConfigList: RuleConfigList,
					onTheRuleConfigObjectPage: RuleConfigObjectPage,
					onTheRuleConfigAssignmentsToLocationsObjectPage: RuleConfigAssignmentsToLocationsObjectPage
                }
            },
            opaJourney.run
        );
    }
);