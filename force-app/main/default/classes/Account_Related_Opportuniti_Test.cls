@isTest
public class Account_Related_Opportuniti_Test {
    @isTest
    private static void oppPage(){
        Account_Related_Opportunities opp = new Account_Related_Opportunities();
        opp.getopp();
        opp.next();
        opp.first();
        opp.last();
        opp.previous();
        opp.getprev();
        opp.getnxt();
    }
}