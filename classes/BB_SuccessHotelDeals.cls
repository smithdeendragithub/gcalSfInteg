public class BB_SuccessHotelDeals {
    public List<Result> finaldeals{get;set;}
    public List<Errors> Errors;
    public List<Result> Result;
//    public String registerid{get;set;}
    public String bbeventStartDateParam{get;set;}
    public String bbeventVenueParam{get;set;}
    public Boolean gotDeals{get;set;}
    
    public BB_SuccessHotelDeals(){
        system.debug('before constructor');
//        registerid =  Apexpages.currentPage().getParameters().get('RegistrationId');
        bbeventStartDateParam =  Apexpages.currentPage().getParameters().get('eventStartDateParam');
        bbeventVenueParam =  Apexpages.currentPage().getParameters().get('eventVenueParam');
System.debug('Smith-BB_SuccessHotelDeals - eventStartDateParam :'+bbeventStartDateParam+'eventVenueParam :'+bbeventVenueParam);
        String url = 'http://api.hotwire.com/v1/deal/hotel?apikey=3z3ey2wxq9937swgfz7uah27&format=json&limit=5&dest='+bbeventVenueParam+'&startdate='+bbeventStartDateParam;
        HttpRequest hoteldealreq = new HttpRequest();
        hoteldealreq.setEndpoint(url);
        hoteldealreq.setMethod('GET');
        Http httphotel = new Http();
        HttpResponse deals = httphotel.send(hoteldealreq);
        BB_SuccessHotelDeals hotelDeals = parse(deals.getBody());
        finaldeals = hotelDeals.Result;
        gotDeals = finaldeals.isEmpty();
        
        if(gotDeals){
        ApexPages.Message Nodeals= new ApexPages.Message(ApexPages.Severity.INFO, 'Sorry No Deals found');
        ApexPages.addMessage(Nodeals);  
        }
    }
    public class Errors {
    }
    
    public class Result {
        public String FoundDate;
        public String CurrencyCode{get;set;}
        public String NightDuration;
        public String EndDate;
        public String Headline;
        public String IsWeekendStay;
        public String Price{get;set;}
        public String StartDate{get;set;}
        public String Url{get;set;}
        public String City{get;set;}
        public String CountryCode;
        public String NeighborhoodLatitude;
        public String NeighborhoodLongitude;
        public String Neighborhood;
        public String NeighborhoodId;
        public String RecommendationPercentage;
        public String SavingsPercentage{get;set;}
        public String StarRating{get;set;}
        public String StateCode;
    }
    public static BB_SuccessHotelDeals parse(String hoteldealJSON) {
        return (BB_SuccessHotelDeals) System.JSON.deserialize(hoteldealJSON, BB_SuccessHotelDeals.class);
    }
}