public class batchScheduledTask_2 implements schedulable {
    public void execute(schedulableContext sc){
        batchClassTask_2  obj = new batchClassTask_2();
        Database.executeBatch(obj);
    }
}