public class batchClassTask_2 implements Database.Batchable<sObject>,Database.stateful {
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Name,Id,Description From Account]);
    }
    public void execute(Database.BatchableContext bc,List<Account> accList ){
        for (Account acc : accList) {
            DateTime dt = Datetime.now();
            acc.Description = 'Todays Date And Time '+dt;
        }
        update accList;
    }
    public void finish(Database.BatchableContext bc){

    }
}