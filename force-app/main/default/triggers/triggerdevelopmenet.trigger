trigger triggerdevelopmenet on Event_Speaker__c (before insert,before update) {
    if(trigger.isbefore)
    {
        system.debug(Trigger.new);
        maxfittriggerhandler.maxfitTriggerhandlerMethodInsert(trigger.new);
    }

}