trigger triggeroneventattendee on Event_Attendee__c (after insert) {
    if(trigger.isAfter && trigger.isInsert)
    {
      MaxFitEmailTriggerHandler.sendEmailNotification(trigger.new);
 
    }
 
}