public with sharing class wizardController {
    @AuraEnabled(cacheable=true)
    public static List<sObject> getRecords(String objectName) {
        String query = 'SELECT  Name FROM ' + objectName;
        // System.debug('Name : '+Database.query(query));
        return Database.query(query);
    }
    @AuraEnabled
    public static void mailsend(Id objId,String mailBody,String mailSubject , String objectName){
        List<Id> listName = new List<Id>();
        listName.add(objId);
        String mail = 'SELECT Email FROM ' + objectName + ' WHERE Id IN ';
        mail += ':listName';
        List<sObject> listData = Database.query(mail);
        String email;
        for (sObject record : listData) {
             email = (String)record.get('Email');
            System.debug('Email: ' + email);
        }
        Messaging.SingleEmailMessage emailMessage = new Messaging.SingleEmailMessage();
        emailMessage.setToAddresses(new String[] { email });
        emailMessage.setSubject(mailSubject);
        emailMessage.setHtmlBody(mailBody);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { emailMessage });
    }
}   