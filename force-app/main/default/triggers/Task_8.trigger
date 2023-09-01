trigger Task_8 on Contact (after delete) {
    List<Account> accList = [SELECT Name,Id FROM Account];
    List<Account> accList2 = new List<Account>();
    for(Contact con: Trigger.old){
        for (Account acc : accList) {
            if (con.AccountId == acc.Id) {
                accList2.add(acc);
            }
        }
    }
    delete accList2;
}
