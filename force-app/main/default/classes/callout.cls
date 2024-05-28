public class callout {
    public void caller(string pname,string pphone, string pEmail){
 Candidate__c con = new Candidate__c(Name = pname, Phone__c = pphone,E_mail__c=pEmail);
    insert con;
        candidatee(pname,pphone,pEmail);
    }
        @Future(callout=true)
        public static void candidatee(string pname,string pphone, string pEmail){
        calloutMethod call = new calloutMethod();
        call.calloutMethodCan(pname,pphone,pEmail);
    }
}