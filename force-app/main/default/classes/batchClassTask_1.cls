public class batchClassTask_1 implements Database.Batchable<sObject>,Database.stateful {
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Name,Id,Account.Name From Opportunity]);
    }
    public void execute(Database.BatchableContext bc,List<Opportunity> oppList ){
        for (Opportunity opp : oppList) {
            if (opp.AccountId != null) {
                opp.Name = opp.Account.Name;
            }
            
        }
        update oppList;
    }
    public void finish(Database.BatchableContext bc){

    }
}   