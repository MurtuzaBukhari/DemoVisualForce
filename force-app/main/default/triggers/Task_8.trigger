trigger Task_8 on Contact (after delete,after insert , after update , before insert , before  update , before delete) {
    // List<Account> accList = [SELECT Name,Id FROM Account];
    // List<Account> accList2 = new List<Account>();
    // for(Contact con: Trigger.old){
    //     for (Account acc : accList) {
    //         if (con.AccountId == acc.Id) {
    //             accList2.add(acc);
    //         }
    //     }
    // }
    // delete accList2;
    //Task_8
        if (Trigger.isDelete) {
            if (Trigger.isAfter) {
                ContactClassTrigger.deleteAccount(Trigger.old);
            }
        }

        // Task_11
        if (Trigger.isInsert) {
            if (Trigger.isBefore) {
                ContactClassTrigger.Task_11(Trigger.new);
            }
        }

}
