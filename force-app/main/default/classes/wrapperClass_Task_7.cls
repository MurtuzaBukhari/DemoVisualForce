public class wrapperClass_Task_7 {
    @AuraEnabled
    public static List<AccountWrapper> getAccount(){
        List<AccountWrapper> accList = new List<AccountWrapper>(); 
        for (Account acc : [select id,Name,(select id,FirstName,LastName FROM Contacts ),(select id,name from opportunities ) From Account]) {
            AccountWrapper objWraAcc = new AccountWrapper();
            objWraAcc.isSelected = false;
            objWraAcc.objAcc = acc;
            System.debug('Account : '+acc+' Contact : '+acc.Contacts+' Opportunity : '+ acc.opportunities);
            if (acc.Contacts != null) {
                // System.debug('Contact' + acc.Contacts);
                objWraAcc.objcon = acc.Contacts;
            }
            if (acc.opportunities != null) {
                // System.debug('Opportunity'+acc.opportunities);
                objWraAcc.objopp = acc.opportunities;
            }
            accList.add(objWraAcc);
        }
            return accList;  
    } 
    public class AccountWrapper{
        @AuraEnabled
            public boolean isSelected;
            @AuraEnabled
            public Account objAcc; 
            @AuraEnabled
            public List<Contact> objcon; 
            @AuraEnabled
            public List<Opportunity> objopp;
        public AccountWrapper(){
            this.isSelected = false;
            this.objAcc = new  Account();
            this.objcon = new  List<Contact>();
            this.objopp = new  List<Opportunity>();
        }
    }
}

// (SELECT Id,Name FROM Contact),(SELECT Id,Name FROM Opportunity)
// objWraAcc.objcon = acc.Contacts;
// objWraAcc.objopp = acc.opportunities;