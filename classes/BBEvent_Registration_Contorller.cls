public class BBEvent_Registration_Contorller {
    public BlueBerryEventRegistration__c newregistration;
    public List<BlueBerrySession__c> sessionList;
    public List<BlueBerryEvent__c> eventRecordList;
    public String firstName{get;set;}
    public String lastName{get;set;}
    public String registerEmail{get;set;}
    //public Boolean isAvailable {get;set;}
    public String eventRecord;
    public string selectedSession{get;set;}
    public List<SelectOption> sessionOptionsList{ get;set; }
    public Id contactId;
    //public String registrationid{get;set;}
    public Date tempdate;
    public  String eventStartDateParam;
    public  String eventVenueParam;
    public String duplicateRecord{get;set;} 
    public BBEvent_Registration_Contorller(){
        
    }
    public void pageload(){
        eventRecord = Apexpages.currentPage().getParameters().get('eventRecordId');
        
        eventRecordList = [select id,Name,Event_Start_Date__c,BlueBerryVenue__r.Name,(select Id,Name,session_capacity__C,Total_registration__C from BlueBerrySessions__r) from BlueBerryEvent__c where id =:eventRecord];
        if(!eventRecordList.isEmpty()){
            sessionList= eventRecordList[0].BlueBerrySessions__r;
            tempdate = eventRecordList[0].Event_Start_Date__c;
            eventStartDateParam = String.valueOf(tempdate.month())+'/'+String.valueOf(tempdate.day())+'/'+String.valueOf(tempdate.year());
            eventVenueParam  = eventRecordList[0].BlueBerryVenue__r.Name;
            system.debug('eventStartDateParam :'+eventStartDateParam);
        }
//        System.debug('\nSmith-BBEvent_Registration_Contorller in method pageload : \neventListId='+eventRecord+'\n eventStartDateParam :'+eventStartDateParam+'\n eventVenueParam :'+eventVenueParam);
        newregistration = new BlueBerryEventRegistration__c();
        
        sessionOptionsList = new list<SelectOption>();
        //sessionOptionsList.add(new SelectOption('----SelectOption------','----SelectOption------'));
        for (BlueBerrySession__c temp : sessionList)
        {
            if(temp.session_capacity__C > temp.Total_registration__C)
            sessionOptionsList.add(new SelectOption(temp.Id,temp.Name));
        }
    }
    
    public PageReference completeRegistration(){
        List<Contact> contactlist = [Select id,Email from Contact where Email=:registerEmail];
        if(contactlist.isEmpty()){
            Account newAccount = new Account(Name=firstName);
            insert newAccount;
            Contact newcontact = new Contact();
            newcontact.AccountId=newAccount.Id;
            newcontact.FirstName=firstName;
            newcontact.LastName=lastName;
            newcontact.Email=registerEmail;
            insert newcontact;
            contactId = newcontact.Id;          
        }
        else{
            contactId=contactlist[0].Id;
        }

        BlueBerryEventRegistration__c bookAttendee = new BlueBerryEventRegistration__c();
        bookAttendee.BlueBerryEvent__c = Id.valueOf(eventRecord);
        bookAttendee.Contact__c = Id.valueOf(contactId);
        bookAttendee.BlueBerrySession__c = Id.valueOf(selectedSession);
        Database.SaveResult registration = Database.insert(bookAttendee,false);
        if (registration.isSuccess())
        {
            PageReference tosuccesspage = Page.BB_REGISTRATION_SUCCESS;
            tosuccesspage.getParameters().put('eventStartDateParam',eventStartDateParam);
            tosuccesspage.getParameters().put('eventVenueParam',eventVenueParam);
            tosuccesspage.setRedirect(false);
            return tosuccesspage;    
        }
        else{
            duplicateRecord = '';             
            for(Database.Error err : registration.getErrors())
            {
                duplicateRecord += (err.getMessage() + '  ');
                //duplicateRecord = 'Oops! Event already registered with the given Email ID. Please Note Event registration is allowed only once  irrespective of Session';
            }
            ApexPages.Message duplicateRecords= new ApexPages.Message(ApexPages.Severity.INFO, duplicateRecord);
            ApexPages.addMessage(duplicateRecords);  
            return null; 
        }
    }
  
}