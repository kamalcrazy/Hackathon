sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'businesspartner/test/integration/FirstJourney',
		'businesspartner/test/integration/pages/BuisinessPartnerList',
		'businesspartner/test/integration/pages/BuisinessPartnerObjectPage'
    ],
    function(JourneyRunner, opaJourney, BuisinessPartnerList, BuisinessPartnerObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('businesspartner') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBuisinessPartnerList: BuisinessPartnerList,
					onTheBuisinessPartnerObjectPage: BuisinessPartnerObjectPage
                }
            },
            opaJourney.run
        );
    }
);