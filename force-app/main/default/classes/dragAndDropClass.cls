public class dragAndDropClass {
    @AuraEnabled
    public static List<Contact> getAccountId1(Id searchKey1){
        System.debug('key 1'+searchKey1);
        // System.debug('Account 1'+[SELECT LastName FROM Contact WHERE AccountId  =:searchKey1].size());
        return [SELECT Id,LastName,Phone,AccountId FROM Contact WHERE AccountId  =:searchKey1];
    }
    @AuraEnabled
    public static List<Contact> getAccountId2(Id searchKey2){
        System.debug('key 2'+searchKey2);
        // System.debug('Account 2'+[SELECT LastName FROM Contact WHERE AccountId  =:searchKey2].size());
        return [SELECT Id,LastName,Phone,AccountId FROM Contact WHERE AccountId =:searchKey2];
    }
    @AuraEnabled
    public static List<Contact> updateAccountId1(Id accId, Id ConId){
        // System.debug('key'+searchKey2);
        // System.debug('Account 2'+[SELECT LastName FROM Contact WHERE AccountId  =:searchKey2].size());
        // List<Contact> conList = [SELECT LastName FROM Contact WHERE Id  =:ConId];
        System.debug('Account 1 : '+accId);
            Contact con = [SELECT LastName FROM Contact WHERE Id  =:ConId];
            con.AccountId = accId;
            // conList.add(con);
            update con;
        return [SELECT Id,LastName,Phone,AccountId FROM Contact WHERE AccountId =:accId];
        // return getAccountId1();
    }
    @AuraEnabled
    public static List<Contact> updateAccountId2(Id accId, Id ConId){
        // System.debug('key'+searchKey2);
        // System.debug('Account 2'+[SELECT LastName FROM Contact WHERE AccountId  =:searchKey2].size());
        // List<Contact> conList = [SELECT LastName FROM Contact WHERE Id  =:ConId];
        System.debug('Account 2 : '+accId);
            Contact con = [SELECT LastName FROM Contact WHERE Id  =:ConId];
            con.AccountId = accId;
            // conList.add(con);
            update con;
            
        return [SELECT Id,LastName,Phone,AccountId FROM Contact WHERE AccountId =:accId];
        // return getAccountId2();
    }
}
// 0015j0000180SF0AAM
// 0015j0000180VPcAAM