public with sharing class Studentinsertion {
    @AuraEnabled
    public static String studentUsingAura(String firstName,String lastName, Integer age,Date dateofbirth,String mobileno,String gender,Boolean graduated  ){
        Student__c studentObject=new Student__c();
        studentObject.Name=firstName;
        studentObject.Last_Name__c=lastName;
        studentObject.Gender__c=gender;
        studentObject.Age__c=age;
        studentObject.Graduated__c=graduated;
        studentObject.Date_of_Birth__c=dateofbirth;
        studentObject.Mobile_Number__c=mobileno;
        try{
            Database.insert(studentObject);
            return 'success';
        }catch(DMlException e){
            return e.getMessage();
        }
    }
}
