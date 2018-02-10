public class AccountHandler{
public static Account insertNewAccount(String accname){

try{
Account acc = new Account();
acc.Name=accname;
insert(acc);
//Database.SaveResult[] srlist = Database.insert(acc,false);

//for (Database.SaveResult sr: srlist){
//if(sr.success())
return acc;
//}
}
Catch(DmlException e){
return null;
}
}

}