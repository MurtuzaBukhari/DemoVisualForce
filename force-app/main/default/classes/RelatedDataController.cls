public with sharing class RelatedDataController {
    @AuraEnabled(cacheable=true)
    public static RelatedDataWrapper getRelatedData(Id accountId) {
        RelatedDataWrapper result = new RelatedDataWrapper();
        
        
        result.contacts = [SELECT Id, Name FROM Contact WHERE AccountId = :accountId ]; 
        result.opportunities = [SELECT Id, Name FROM Opportunity WHERE AccountId = :accountId ]; 

        return result;
    }

    public class RelatedDataWrapper {
        @AuraEnabled public List<Contact> contacts;
        @AuraEnabled public List<Opportunity> opportunities;
    }
}
