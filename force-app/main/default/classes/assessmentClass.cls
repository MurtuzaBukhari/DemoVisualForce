public class assessmentClass {
    @AuraEnabled
    public static List<Account> getAccount(String Status){
        System.debug('Status : '+Status);
        List<Account> accList = [SELECT Name,Id FROM Account WHERE Status__c =: Status ];
        List<Contact> conList = new List<Contact>();
            System.debug('Account List : '+accList);     
            for (Account acc : accList) {
                System.debug('Name : '+acc.Name);
                System.debug('Id : '+acc.Id);
            }
        return accList;
    }
    @AuraEnabled
    public static List<Contact> getContact(Id conId){
       System.debug('Id : '+conId);
       List<Contact> conList = [SELECT LastName,Account.Name FROM Contact WHERE AccountId =: conId];
       System.debug('Con List : '+conList);
       return conList;
    }
}