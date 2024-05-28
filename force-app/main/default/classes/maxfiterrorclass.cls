public class maxfiterrorclass {
    public static void logError( String logDetails, String processName)
    {
        Error_Log__c err = new Error_Log__c();
         err.Log_Date_Time__c = DATETIME.NOW();
         err.Log_Details__c = logDetails;
         err.Process_Name__c = processName;
         try {
            insert err;
        } catch (DmlException e) {
            System.debug('Error inserting Error Log record: ' + e.getMessage());
        }

    }

 


}