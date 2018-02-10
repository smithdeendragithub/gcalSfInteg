global class unregisterAttendeeSchedule implements Schedulable{
    global void execute(SchedulableContext sc){
      String querytodelete='SELECT Id FROM BlueBerryEventRegistration__c WHERE Cancel_Registration__c = true ';
        unregisterAttendee removeBatch = new unregisterAttendee(querytodelete);
        Id BatchProcessId = Database.ExecuteBatch(removeBatch);
    }
}