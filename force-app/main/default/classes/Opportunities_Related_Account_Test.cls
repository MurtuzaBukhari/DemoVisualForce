@isTest
public class Opportunities_Related_Account_Test {
    @isTest
    private  static void accPage(){
        Opportunities_Related_Account acc = new Opportunities_Related_Account();
        acc.getacc();
        acc.next();
        acc.first();
        acc.last();
        acc.previous();
        acc.getprev();
        acc.getnxt();
    }
}
