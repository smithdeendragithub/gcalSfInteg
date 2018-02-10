public class ContactAndLeadSearch{
public static List<list<SObject>> searchContactsAndLeads(String searchstring){
List<list<SObject>> searchresults = [FIND :searchstring in ALL FIELDS RETURNING contact(firstname,lastname),Lead (firstname,lastname)];
return searchresults;
}
}