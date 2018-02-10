public with sharing class TestingClass {

    public Invoice__c inv{get;set;}
    //public Line_Item__C litm{get;set;}
    public TestingClass(){
       // inv=[select name,total_invoice__c,status__c,triggerupdatefield__c from Invoice__c where name='IN-0005'];
    }
   
    public static void triggertesting(Invoice__c[] invoice){
        List <Id> invid = new List <Id>();
        
        for (Invoice__c inv : invoice){
            if(inv.Status__c=='closed'){
            invid.add(inv.id);
            inv.triggerupdatefield__C='beforeupdatetrigger'+ System.now();}
        }
system.debug('place1');
            //if (inv.name=='IN-0005')
            
            
            List <Line_Item__c> litm = [select linebeforetrigger__c, lineaftertrigger__c from Line_item__c where invoice__c in :invid];
            for (Line_item__c Linetm : litm){
       system.debug('place2'); 
                
                linetm.linebeforetrigger__c='BeforeUpdateTrigger'+ System.now();
                linetm.lineaftertrigger__c='AfterUpdateTrigger'+ System.now();
            }
            update litm;
        }  
 
    
    public static void cloneattachment (Attachment[] newattach){
        List <Id> listid = new List<Id>();
//        Attachment[] newcreatedattach = new Attachment();
        for (Attachment tempattach : newattach)
        {
            listid.add(Id.valueof(tempattach.Name)); 
        }
        Attachment[] oldattach = [select ID,NAME,DESCRIPTION,BODY FROM ATTACHMENT WHERE ID IN :listid];
        for (Attachment newtemploop : newattach){
            for (Attachment oldtemploop : oldattach){
                if(newtemploop.Name==oldtemploop.id){
                    newtemploop.NAME=oldtemploop.NAME;
                    newtemploop.BODY=oldtemploop.BODY;
                    newtemploop.DESCRIPTION=oldtemploop.DESCRIPTION;

                }
            }
        }
        //insert newattach;
    }
        
    
}