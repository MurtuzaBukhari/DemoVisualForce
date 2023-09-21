public class batchClassTask_2 implements Database.Batchable<sObject>,Database.stateful {
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Name,Id,Description From Account]);
    }
    public void execute(Database.BatchableContext bc,List<Account> accList ){
        List<Account> accList_1 = new List<Account>();
        for (Account acc : accList) {
            DateTime dt = Datetime.now();
            acc.Description = 'Todays Date And Time '+dt;
            accList_1.add(acc);
        }
        update accList_1;
    }
    public void finish(Database.BatchableContext bc){

    }
}