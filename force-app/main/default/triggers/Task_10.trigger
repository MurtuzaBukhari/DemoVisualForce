trigger Task_10 on Account (before insert) {
    List<Contact> con = new List<Contact>();
    for (Account acc : Trigger.new) {
        Contact conList = new Contact();
        conList.LastName = acc.Name;
        conList.AccountId = acc.Id;
        con.add(conList);
    }
    insert con;
}