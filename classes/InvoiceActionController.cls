public class InvoiceActionController{
    
    public InvoiceActionController(){
        inv=[select name,total_invoice__c,status__c,triggerupdatefield__c from Invoice__c where name='IN-0005'];
    }
    
    Public Invoice__c inv {get;set;}
    public String smith1 {get;set;}
    Public String inputvalue1 {get;set;}
    
    public PageReference invoiceaction(){
        System.debug('stage 1'+ smith1);
        
        inputvalue1=smith1;
        
        smith1=null;
        System.debug('stage 1'+ smith1);
        Long startingTime = System.now().getTime(); // Num milliseconds since Jan 1 1970
        Integer delayInMilliseconds = 1500; // One-second delay
        while (System.now().getTime() - startingTime < delayInMilliseconds)  {
            // Do nothing until desired delay has passed
        }
      //  PageReference finalreults = new PageReference("$resource.finalreults");
      //  
      System.debug('Before executing');
		inv = [select Name,Status__c,Total_Invoice__c,triggerupdatefield__c from Invoice__c where Name = :inputvalue1];
        
        //System.debug('{!inv}');
      	List <Line_Item__c> litm = [Select Name,Merchandise__c,Quantity__c,Total_cost__c,Unit_Price__c 
                                    from Line_Item__c where Invoice__c = :inv.Id ];
        
    //  PageReference testpage = Page.finalreults;
//testpage.setRedirect(false);
//return OpenNewPage;
        //return testpage;
        return null;
        
    }
    //inputvalue1=smith;
    public PageReference returnpage(){
    /*    //public Invoice__c inv3 {get;set;}
        //public List <Line_Item__c> litm3 {get;set;}
PageReference returnpage = Page.InvoiceActionpage;
        returnpage.setredirect(true);
        return returnpage;*/
        return null;
    }

}