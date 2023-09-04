trigger Task_12 on Account (before insert) {
List<String> str = new List<String>();

for (Account acc_1 : Trigger.new) {
    str.add(acc_1.Name);
}
List<Account> accList = [SELECT Id,Name FROM Account WHERE Name=:str];
List<Account> accDelete = new List<Account>();
for (Account acc : accList) {
    accDelete.add(acc);
}
delete accDelete;
}



