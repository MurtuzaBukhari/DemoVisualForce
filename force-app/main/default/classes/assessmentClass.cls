public class assessmentClass {
    @AuraEnabled
    public static List<Account> getAccount(String Status){
        System.debug('Status : '+Status);
        List<Account> accList = [SELECT Name,(SELECT LastName FROM Contacts ) FROM Account WHERE Status__c =: Status ];
        System.debug('Account List : '+accList);
        return accList;
    }
}