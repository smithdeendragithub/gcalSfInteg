public class WelcomeController {
    public PageReference Eventlist(){
        PageReference pageref = Page.EVENTSLIST;
        pageref.setRedirect(true);
        return(pageref);
    }
}