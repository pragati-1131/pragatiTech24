public class maxfittriggerhandler {
        public static void maxfitTriggerhandlerMethodInsert(List<Event_Speaker__c> EventSpeakerList)
    {
        Set<ID> SpeakerId = new Set<Id>();
        for(Event_Speaker__c sp : EventSpeakerList)
        {
            SpeakerId.add(sp.Speaker__c);
        }
        List<Event_Speaker__c> SpeakerDetails = [ SELECT Id, Speaker__c, Event__c FROM Event_Speaker__c WHERE Speaker__c IN :SpeakerId ];
		Map<Id, Event_Speaker__c> mp = new Map<Id, Event_Speaker__c>();
        For(Event_Speaker__c sp  : SpeakerDetails)
        {
             mp.put(sp.Speaker__c, sp);
        }
         for (Event_Speaker__c es :EventSpeakerList ) 
         {        
            if (mp.containsKey(es.Speaker__c)) {
                es.addError('This speaker is already booked for another event.');
         }
    }

    }
 
  }