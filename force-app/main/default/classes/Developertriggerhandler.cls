public class Developertriggerhandler {
    public static void fun(List<Developer__c> devList){
        for(Developer__c d : devList){
            d.organization__c = 'Mirketa';
        }
    }
}