public class InsertionDetails {
    public static void createPersonDetails(List<Account> newAccounts) {
        List<Person_Detail__c> personDetailsToInsert = new List<Person_Detail__c>();

        for (Account acc : newAccounts) {
            Person_Detail__c pd = new Person_Detail__c();
            pd.Name = acc.Name;                
            pd.Person_Phone__c = acc.Phone;           
            pd.Description__c = acc.Description;  
           // pd.Email = acc.PersonEmail__c;    
            pd.Employee_ID__c = acc.ID;      
            pd.Account__c = acc.id;     

            personDetailsToInsert.add(pd);
        }

       // if (!personDetailsToInsert.isEmpty()) {
            insert personDetailsToInsert;
        //}
    }

}