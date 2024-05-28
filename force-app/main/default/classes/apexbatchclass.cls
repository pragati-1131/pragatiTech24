public class apexbatchclass implements Database.Batchable<sObject>, Database.Stateful {
    public Integer recordsProcessed = 0;
	public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('Select id,	End__c,Live__c from Event__c');
    }
    public void execute(Database.BatchableContext bc, List<Event__c> Eventobj){
      List<Event__c> deleteEvent=new  List<Event__c>();
            Datetime currentDate= Datetime.now();
            Datetime twoMonths=currentDate.addMonths(-2);
        	for(Event__c eventRecord:eventObj)
            {
                if(eventRecord.End__c<twoMonths && eventRecord.Live__c==true){
                    deleteEvent.add(eventRecord);
                    recordsProcessed = recordsProcessed + 1;
                }
            }
            try{
            Database.delete(deleteEvent);
            }catch (DmlException e) {
                System.debug(e.getMessage());
            }
        }
    
    
     public void finish(Database.BatchableContext bc){
         Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new String[] { 'pragati.yadav@mirketa.com' });
            email.setSubject('Batch Execution Completed');
            email.setPlainTextBody('Deletion of Old Records is Done.\n'+recordsProcessed+' records has been deleted' );
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
         }
    
         
     
}