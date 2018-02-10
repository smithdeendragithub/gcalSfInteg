public class ProcesBuilderTest {
    @invocableVariable
      public List<String> descriptionString= new List<String>();
    @invocableMethod
    public static void testingInvocableMethods(List<Id> recordId){
        String tempString;
     List<String> descriptionString= new List<String>();

	List<case> listcase = [Select description from case where id in :recordId];
        for(case c:listcase){
            tempString=String.valueOf(System.now());
            c.description=c.description+'Testing'+tempString;
            descriptionString.add(c.description);
        }
        update listcase;
    //return descriptionString;
    }
}