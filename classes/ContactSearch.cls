public class ContactSearch{
public static List<contact> searchForContacts(String In_lastname,String In_mpc){

List <Contact> conlist = [select Id,Name from Contact where lastname=:In_lastname and mailingpostalcode=:In_mpc];
return conlist;

}

}