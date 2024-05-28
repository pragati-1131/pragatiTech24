public class MaxFitEmailTriggerHandler {
    public static void sendEmailNotification(List<Event_Attendee__c> EventAttendeeList)
    {
          List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
          Set<Id> attendeeIds = new Set<Id>();
 
        for (Event_Attendee__c myEvent : EventAttendeeList) {
            if (myEvent.Attendees__c != null) {
                attendeeIds.add(myEvent.Attendees__c);
            }
        }
        Map<Id, Attendees__c> attendeeMap = new Map<Id, Attendees__c>([
            SELECT Id, Name,E_mail__c FROM Attendees__c WHERE Id IN :attendeeIds
        ]);
 
        Set<Id> eventIds = new Set<Id>();
        for (Event_Attendee__c myEvent : EventAttendeeList) {
            if (myEvent.Event__c != null) {
                eventIds.add(myEvent.Event__c);
            }
        }
        Map<Id, Event__c> eventMap = new Map<Id, Event__c>([
            SELECT Id, Name__c, Start__c, Locationn__c, Event_Organizer__c FROM Event__c WHERE Id IN :eventIds
        ]);
 
        for (Event_Attendee__c myEvent : EventAttendeeList) {
            Attendees__c attendee = attendeeMap.get(myEvent.Attendees__c);
            Event__c event = eventMap.get(myEvent.Event__c);
 
            if (attendee != null && attendee.E_mail__c != null && event != null) {
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                List<String> sendTo = new List<String>();
                sendTo.add(attendee.E_mail__c);
                mail.setToAddresses(sendTo);
                mail.setSubject('Pass for the ' + event.Name__c);
                String body = 'Dear ' + attendee.Name + ',<br/>';
                List<LocationAddressbook__c> l1 = [SELECT Name, State__c, Country__c from LocationAddressbook__c where Id =: event.Locationn__c];
 body += 'Thank you for registering for ' + event.Name__c + ' which will be organized on ' + event.Start__c + ' & will be held in ' + l1[0].Name + '. We are excited to have you, see you at the event.'+'<br/>';
                body += 'Thanks,'+'<br/>';
                List<EventOrgainizer__c> temp=[SELECT Name from EventOrgainizer__c where Id =: event.Event_Organizer__c];
                body += temp[0].Name;
                mail.setHtmlBody(body);
 
                mails.add(mail);
 
                System.debug('Email created for: ' + attendee.E_mail__c);
            } else {
                System.debug('Attendee or Event is null for Event_Attendee__c Id: ' + myEvent.Id);
            }
        }
        if (!mails.isEmpty()) {
            Messaging.sendEmail(mails);
            System.debug('Emails sent: ' + mails.size());
        } else {
            System.debug('No emails to send.');
        }
    }
    }