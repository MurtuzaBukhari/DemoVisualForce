public class workBench_ApexExecute {
    public void meth(){
        List<Account> accList = new List<Account>();
        for (Integer i = 0; i < 2000; i++) {           
            Account acc = new Account();
            acc.Name = 'WorkBench'+' '+ i + 'Demo';
            accList.add(acc);
        }
        insert accList;
    }
}