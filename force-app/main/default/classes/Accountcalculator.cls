public class Accountcalculator {
    @future
    public static void countcontacts(list<Id>accids){
       List<Account>acclist=[SELECT ID ,(SELECT id FROM  contacts)FROM Account Where  id IN:accIds ];
        for(Account acc:acclist){
acc.Numberofcontact__c=acc.contacts.size();
        }
} 
}