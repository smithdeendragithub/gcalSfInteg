public class CountryStateController 
{
    public String country{get;set;}
    
    public CountryStateController(){
        
    }
    
     public List<SelectOption> getcountryOptions() 
     {
            List<SelectOption> countryOptions = new List<SelectOption>();        
             
            countryOptions.add(new SelectOption('India','India'));
            countryOptions.add(new SelectOption('USA','USA'));
            countryOptions.add(new SelectOption('Japan','Japan'));
  
            return countryOptions;
     }
}