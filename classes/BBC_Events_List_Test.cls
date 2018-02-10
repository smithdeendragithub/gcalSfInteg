@isTest
public class BBC_Events_List_Test {
    
    @testSetup static void createRecords(){
        
        Account acc1 = new Account(Name='test1account');
        insert acc1;
        Account acc2 = new Account(Name='test1account');
        insert acc2;
        
        contact c1 = new Contact(firstname='contact1',lastname='contact1',accountid=acc1.id);
        insert c1;
        contact c2 = new Contact(firstname='contact2',lastname='contact2',accountid=acc2.id);
        insert c2;
        
        BlueBerryVenue__c venue1 = new BlueBerryVenue__c(Name='venue1',VenueAddress__c='Test2 Address2',Venue_Capacity__c=30,Venue_Contact__c='4164164141');
        insert venue1;
        BlueBerryVenue__c venue2 = new BlueBerryVenue__c(Name='venue2',VenueAddress__c='Test2 Address2',Venue_Capacity__c=20,Venue_Contact__c='4616166116');
        insert venue2;
        
        BlueBerryEvent__c event1 = new BlueBerryEvent__c();
        event1.Name='Event 1';
        event1.BlueBerryVenue__c=venue1.id;
        event1.Status__c='Active';
        event1.Event_Capacity__c=30;
        event1.Event_Start_Date__c=date.newInstance(2016, 11, 15);
        event1.Event_End_Date__c=date.newInstance(2016, 11, 16);
        event1.Event_Due_Date__c=date.newInstance(2016, 11, 14);
        insert event1;
        
        
        BlueBerryEvent__c event2 = new BlueBerryEvent__c();
        event2.Name='Event 2';
        event2.BlueBerryVenue__c=venue2.id;
        event2.Status__c='Active';
        event2.Event_Capacity__c=20;
        event2.Event_Start_Date__c=date.newInstance(2016, 12, 15);
        event2.Event_End_Date__c=date.newInstance(2016, 12, 16);
        event2.Event_Due_Date__c=date.newInstance(2016, 12, 14);
        insert event2;
        
        BlueBerrySession__c sessione1s1 = new BlueBerrySession__c();
        sessione1s1.name='e1s1';
        sessione1s1.BlueBerryEvent__c=event1.id;
        sessione1s1.Session_Capacity__c=15;
        insert sessione1s1;
        BlueBerrySession__c sessione1s2 = new BlueBerrySession__c();
        sessione1s2.name='e1s2';
        sessione1s2.BlueBerryEvent__c=event1.id;
        sessione1s2.Session_Capacity__c=15;
        insert sessione1s2;
        BlueBerrySession__c sessione2s1 = new BlueBerrySession__c();
        sessione2s1.name='e2s1';
        sessione2s1.BlueBerryEvent__c=event2.id;
        sessione2s1.Session_Capacity__c=20;
        insert sessione2s1;
        PageReference welcomepage = Page.WELCOMEPAGE;
        PageReference eventslistpage = Page.EVENTSLIST;
        PageReference listpage = Page.EVENTSLIST;
        
        BlueBerryEventRegistration__c berc1 = new BlueBerryEventRegistration__c();
        berc1.Contact__c=c1.id;
        berc1.BlueBerryEvent__c=event1.id;
        berc1.BlueBerrySession__c=sessione1s1.id;
        berc1.Cancel_Registration__c=true;
        insert berc1;
    }
    static testMethod void testWelcomePage(){
        
        PageReference welcomepage = Page.WELCOMEPAGE;
        PageReference eventslistpage = Page.EVENTSLIST;
        Test.setCurrentPage(welcomepage);
        Test.startTest();
        WelcomeController WC = new WelcomeController();
        PageReference eventslist = WC.Eventlist();
        Test.stopTest();
        System.assertEquals(eventslist.getUrl(), eventslistpage.getUrl());
        
        
    }
    static testMethod void testEventslist(){
        
        PageReference listpage = Page.EVENTSLIST;
        PageReference registerform = Page.BB_REGISTER_FORM;
        Test.startTest();
        List<BlueBerryEvent__c> el = [select id from BlueBerryEvent__c];
        registerform.getParameters().put('eventRecordId',el[0].id);
        Test.setCurrentPage(listpage);
        BBC_Events_List bbevl = new BBC_Events_List();        
        
        PageReference rf = bbevl.RegisterForm();
        rf.getParameters().put('eventRecordId',el[0].id);
        Test.stopTest();
        System.assertEquals(el.size(), bbevl.eventList.size());
        system.assert(true, registerform.getUrl());
        System.assertEquals(registerform.getUrl(), rf.getUrl());
        //System.assertEquals(el[0].id, ApexPages.currentPage().getParameters('eventRecordId'));
    }
    static testMethod void testeventRegistrationcontroller(){
        PageReference successpage = Page.BB_REGISTRATION_SUCCESS;
        Test.startTest();
        BBEvent_Registration_Contorller brc = new BBEvent_Registration_Contorller();
        
        List<BlueBerryEvent__c> be = [select id,Name,(select id,Name from BlueBerrySessions__r) from BlueBerryEvent__c where Name='Event 1'];
        List<BlueBerrySession__c> bs = be[0].BlueBerrySessions__r;
        string rgurl = '/apex/BB_REGISTRATION_SUCCESS?eventRecordId='+be[0].id;
        PageReference registerform = new PageReference(rgurl);
        Test.setCurrentPage(registerform);
        brc.pageload();
        
        brc.firstName='TestUserfirstName';
        brc.lastName='TestUserLastName';
        brc.registerEmail='test@test.com';
        brc.selectedSession=bs[0].id;
        PageReference brcpage = brc.completeRegistration();
        List<contact> cl = [select id,email,firstname,lastname from contact where email='test@test.com'];
        for (contact c:cl){
            system.assertEquals('TestUserfirstName',c.FirstName);
            system.assertEquals('TestUserLastName',c.LastName);
        }
        Test.stopTest();
        system.assertEquals(be[0].id, brc.eventRecord);
        system.assertEquals(1, brc.eventRecordList.size());
        System.assertEquals(bs.size(),brc.sessionList.size());
        
    }
    static testmethod void testhoteldealsController(){
        //List<BlueBerryEvent__c> be = [select id,Name,Event_Start_Date__c,BlueBerryVenue__r.Name from BlueBerryEvent__c where Name='Event 1'];
        //PageReference successpage = Page.BB_REGISTRATION_SUCCESS;
        PageReference successpage = Page.BB_REGISTRATION_SUCCESS;
        
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new mockHotwireWebsite());
        List<BlueBerryEvent__c> be = [select id,Name,Event_Start_Date__c,BlueBerryVenue__r.Name from BlueBerryEvent__c where Name='Event 1'];
        String dateparam = String.valueOf(be[0].Event_Start_Date__c.Month())+'/'+String.valueOf(be[0].Event_Start_Date__c.Day())+'/'+String.valueOf(be[0].Event_Start_Date__c.Year());
        successpage.getParameters().put('eventStartDateParam',dateparam);
        successpage.getParameters().put('eventVenueParam',be[0].BlueBerryVenue__r.Name);
        BB_SuccessHotelDeals bshd = new BB_SuccessHotelDeals();
        Integer resultcount = bshd.finaldeals.size();
        Test.setCurrentPage(successpage);
        Date testdate = date.newInstance(2016, 11, 10);
        Test.stopTest();
        
        System.assertEquals(5, resultcount);
        System.assertEquals('http://www.hotwire.com/hotel/superPage.jsp?encDealHash=MTAwOjI5OTgzOjg4NjY5OjQuMDo2OC4wMDAwMTpZOlk6WQ--&rs=20500&xid=x-103&wid=w-3&rid=r-69820702248&startDate=11/10/2016&endDate=11/13/2016&bid=B311402&sid=S298', bshd.finaldeals[0].url);
        system.assertEquals('USD', bshd.finaldeals[0].CurrencyCode);
        system.assertEquals('34', bshd.finaldeals[0].SavingsPercentage);
        system.assertEquals('68.0', bshd.finaldeals[0].price);
        system.assertEquals('4.0', bshd.finaldeals[0].StarRating);
        system.assertEquals('11/10/2016', bshd.finaldeals[0].StartDate);
        system.assertEquals('Calgary', bshd.finaldeals[0].City);
    }
    static testMethod void testSchedulableclass(){
        String CRON_EXP = '0 0 0 21 11 ? 2016';
        Test.startTest();
        String jobId = System.schedule('ScheduleApexClassTest',CRON_EXP, new unregisterAttendeeSchedule());
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered,NextFireTime FROM CronTrigger WHERE id = :jobId];
        System.assertEquals(CRON_EXP, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);
        System.assertEquals('2016-11-21 00:00:00',String.valueOf(ct.NextFireTime));
        Test.stopTest();
    }
    
}