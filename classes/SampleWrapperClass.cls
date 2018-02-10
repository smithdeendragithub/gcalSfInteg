public class SampleWrapperClass {

    
    Public List<WrapInvoiceEx> samplewrapper{get;set;}
    
    Public List<WrapInvoiceEx> getinvoicewrapper(){
        List<Invoice__c> sampleinv = [select id,Name from Invoice__C order by id limit 5];
        samplewrapper = new List<WrapInvoiceEx>();
        for (Invoice__C wrapinv : sampleinv){
            samplewrapper.add(new WrapInvoiceEx(wrapinv,true));
        }
        return samplewrapper;
    }

    Public class WrapInvoiceEx{
        Public Invoice__c inv{get;set;}
        Public Boolean selectaction1{get;set;}
        public WrapInvoiceEx(Invoice__C inv1,Boolean options1){
            inv = inv1;
            selectaction1 = options1;
        }
    }
    

}