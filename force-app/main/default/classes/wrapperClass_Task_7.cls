public class wrapperClass_Task_7 {
    @AuraEnabled
    public static List<AccountWrapper> getAccount(){
        List<AccountWrapper> accList = new List<AccountWrapper>(); 
        for (Account acc : [Select id,name from Account]) {
            AccountWrapper objWraAcc = new AccountWrapper();
            objWraAcc.isSelected = false;
            objWraAcc.objAcc = acc;
            accList.add(objWraAcc);
            for (Contact con : [SELECT LastName  FROM Contact WHERE AccountId =: acc.Id]) {    
                objWraAcc.objcon = con;
                accList.add(objWraAcc);
            }
            
        }
            return accList;  
    } 
    public class AccountWrapper{
        @AuraEnabled
            public boolean isSelected;
            @AuraEnabled
            public Account objAcc; 
            @AuraEnabled
            public Contact objcon; 
            @AuraEnabled
            public Opportunity objopp;
        public AccountWrapper(){
            this.isSelected = false;
            this.objAcc = new  Account();
            this.objcon = new  Contact();
            this.objopp = new  Opportunity();
        }
    }
}

// (SELECT Id,Name FROM Contact),(SELECT Id,Name FROM Opportunity)