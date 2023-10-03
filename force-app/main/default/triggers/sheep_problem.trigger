trigger sheep_problem on Contact (after update) {
    // Set<Id> str = new Set<Id>();
    // Set<Id> str_1 = new Set<Id>();
    // for (Contact con : Trigger.new) {
    //     if (con.AccountId != Trigger.oldMap.get(con.Id).AccountId) {
    //         str.add(con.AccountId);
    //         str_1.add(Trigger.oldMap.get(con.Id).AccountId);
    //     }
    // }
    // List<Contact> conList = [SELECT Name,AccountId FROM Contact WHERE AccountId IN :str_1];
    // List<Account> accList = [SELECT Name,Id FROM Account WHERE Id IN:str];
    // List<Contact> conUpdate = new List<Contact>();
    // for (Contact con_1 : conList) {
    //     if (con_1.AccountId != null) {
    //         for (Account acc : accList) {
    //             con_1.AccountId = acc.Id;
    //             conUpdate.add(con_1);
    //         }
    //     }
    // }
    // update conUpdate;
    if (Trigger.isAfter && Trigger.isUpdate) {
        Sheep_Problem.updateContactAccount(Trigger.new, Trigger.oldMap);
    }
}

