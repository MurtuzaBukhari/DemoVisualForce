// public class assessmentClass {
//     @AuraEnabled
//     public static List<Account> getAccount(String Status){
//         System.debug('Status : '+Status);
//         List<Account> accList = [SELECT Name,Id FROM Account WHERE Status__c =: Status ];
//         List<Contact> conList = new List<Contact>();
//             System.debug('Account List : '+accList);     
//             for (Account acc : accList) {
//                 System.debug('Name : '+acc.Name);
//                 System.debug('Id : '+acc.Id);
//             }
//         return accList;
//     }
//     @AuraEnabled
//     public static List<Contact> getContact(Id conId){
//        System.debug('Id : '+conId);
//        List<Contact> conList = [SELECT LastName,Account.Name FROM Contact WHERE AccountId =: conId];
//        System.debug('Con List : '+conList);
//        return conList;
//     }
// }
public class assessmentClass {
    @AuraEnabled
    public static List<AccountWrapper> getAccount(String Status){
        List<AccountWrapper> accList = new List<AccountWrapper>(); 
        for (Account acc : [SELECT Name,(SELECT LastName FROM Contacts )FROM Account WHERE 	Status__c =: status]) {
            AccountWrapper objWraAcc = new AccountWrapper();
            objWraAcc.isSelected = false;
            objWraAcc.objAcc = acc;
            System.debug('Account : '+acc+' Contact : '+acc.Contacts);
            if (acc.Contacts != null) {
                // System.debug('Contact' + acc.Contacts);
                objWraAcc.objcon = acc.Contacts;
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
        public AccountWrapper(){
            this.isSelected = false;
            this.objAcc = new  Account();
            this.objcon = new  List<Contact>();
        }
    }
}