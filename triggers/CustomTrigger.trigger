trigger CustomTrigger on Invoice__c (before insert,before update,after insert, after update) {
  Invoice__c[] invoice = Trigger.new;
    //Line_Item__C[] litm;
    //Testingclass.triggertesting (invoice);
    
    if (Trigger.isUpdate && Trigger.isBefore ){
       Testingclass.triggertesting (invoice);
        //Testingclass.lineitembeforetriggertesting(litm);
    }
    
/*    if (Trigger.isUpdate && Trigger.isAfter){
       Testingclass.triggertesting (invoice);
       //Testingclass.lineitemaftertriggertesting(litm);
        
    }*/
}