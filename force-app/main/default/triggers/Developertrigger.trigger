trigger Developertrigger on Developer__c (before insert) {
    if(Trigger.isInsert){
        Developertriggerhandler.fun(Trigger.new);
    }

}