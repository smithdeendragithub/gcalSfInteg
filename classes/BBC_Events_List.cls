public class BBC_Events_List { 
    public List<BlueBerryEvent__c> eventList {get;set;}
    public String eventRecordId {get;set;}
    public BBC_Events_List(){
        eventList =  [Select id,Name, Event_Start_Date__c,Event_Due_Date__c,Available_Sessions__c,Event_Capacity__c,BlueBerryVenue__c,BlueBerryVenue__r.Name,BlueBerryVenue__r.VenueAddress__c,BlueBerryVenue__r.Venue_Contact__c from BlueBerryEvent__c where Status__c='Active' and Event_Due_Date__c > TODAY order by Event_Start_Date__c desc]; 
    }

    public PageReference RegisterForm(){
        PageReference toregisterform = Page.BB_REGISTER_FORM;
        toregisterform.getParameters().put('eventRecordId',eventRecordId);
        toregisterform.setRedirect(true);
        return toregisterform;
    }
    
}