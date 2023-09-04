public class Rollup_Summary{
    public static void onAfterInsert(List<Contact> conList ){
        Set<Id> accId = new Set<Id>();
        List<Account> accList = new List<Account>();
        for (Contact con : conList) {
            if (con.AccountId != null) {
                accId.add(con.AccountId);
            }
        }
        accList = totalAmount(accId);
        if (!accList.isEmpty()) {
            update accList;
        }
    }
    public static void onAfterUpdate(List<Contact> conList,Map<Id, Contact> oldMap ){
        Set<Id> accId = new Set<Id>();
        List<Account> accList = new List<Account>();
        for (Contact con : conList) {
            if (con.AccountId != null && con.Amount_Trigger__c != oldMap.get(con.Id).Amount_Trigger__c) {
                accId.add(con.AccountId);
            }
        }
        accList = totalAmount(accId);
        if (!accList.isEmpty()) {
            update accList;
        }
    }
    public static void onAfterDelete(List<Contact> conList ){
        Set<Id> accId = new Set<Id>();
        List<Account> accList = new List<Account>();
        for (Contact con : conList) {
            if (con.AccountId != null) {
                accId.add(con.AccountId);
            }
        }
        accList = totalAmount(accId);
        if (!accList.isEmpty()) {
            update accList;
        }
    }
    public static List<Account> totalAmount(Set<Id> accId){
        List<Account> accList = new List<Account>();
        Map<Id, Decimal> mapName = new Map<Id, Decimal>();
        for (Contact con : [SELECT Id,Amount_Trigger__c,AccountId FROM Contact WHERE AccountId In : accId ]) {
            Decimal total = 0;
            if (mapName.containsKey(con.AccountId)) {
                total= mapName.get(con.AccountId);
            }
            if(con.Amount_Trigger__c != null){
                total = total + con.Amount_Trigger__c;
            }
            mapName.put(con.AccountId,total);
        }
        if (!mapName.isEmpty()) {
            for (Id i : mapName.KeySet()) {
                Account acc = new Account();
                acc.id= i ;
                acc.Total_Amount_Trigger__c = mapName.get(i);
                accList.add(acc);
            }
        }
        return accList;
    }
}