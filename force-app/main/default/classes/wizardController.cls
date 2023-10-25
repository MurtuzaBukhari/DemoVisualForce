public with sharing class wizardController {
    @AuraEnabled(cacheable=true)
    public static List<sObject> getRecords(String objectName) {
        String query = 'SELECT Id, Name FROM ' + objectName;
        return Database.query(query);
    }
}