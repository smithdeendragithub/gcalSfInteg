Global class unregisterAttendee Implements Database.batchable<sObject>{
    global final string querytofetchRecords;
    global unregisterAttendee(string q){
         querytofetchRecords=q;
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(querytofetchRecords);
    }
    
    global  void execute(Database.BatchableContext BC,List<BlueBerryEventRegistration__c> removeRecords){
        delete removeRecords;
    }
    global void finish(Database.BatchableContext BC){}
    
}