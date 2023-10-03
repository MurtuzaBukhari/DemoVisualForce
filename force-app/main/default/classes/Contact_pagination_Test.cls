@isTest(SeeAllData=true)
public class Contact_pagination_Test {
    @isTest
    private static void conPage(){
        Contact_Pagination_class  p=new Contact_Pagination_class ();
        p.getCon();
        p.next();
        p.first();
        p.last();
        p.previous();
        p.getprev();
        p.getnxt();
    }
}
