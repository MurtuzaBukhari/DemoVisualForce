public class task_5 {

    // Task_5
public static void sendEmails(List<Account> updatedAccounts, Map<Id, Account> oldAccountMap) {
        List<Messaging.Email> emailList = new List<Messaging.Email>();
        Set<Id> accountIdsWithChanges = new Set<Id>();

        // Iterate through the updated accounts to find those with name changes
        for (Account newAccount : updatedAccounts) {
            Account oldAccount = oldAccountMap.get(newAccount.Id);

            if (newAccount.Name != oldAccount.Name) {
                accountIdsWithChanges.add(newAccount.Id);
            }
        }

        // Fetch related contacts with email addresses for accounts with name changes
        List<Contact> conList = [
            SELECT Email, AccountId 
            FROM Contact 
            WHERE AccountId IN :accountIdsWithChanges
            AND Email != null
        ];

        // Iterate through the contacts and create email messages
        for (Contact con : conList) {
            Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
            emailMsg.setToAddresses(new String[] { con.Email });
            emailMsg.setSubject('Account Modified');
            emailMsg.setSenderDisplayName('Your Sender Display Name'); // Replace with a meaningful name
            String emailBody = 'Hi, the parent account "' +Account.Name  + '" has been changed.';
            emailMsg.setHtmlBody(emailBody);
            emailList.add(emailMsg);
        }

        // Send the email messages
        if (!emailList.isEmpty()) {
            Messaging.sendEmail(emailList);
        }
    }
    // Task_7
    public static void Task_7(List<Account> updatedAccounts){
        for (Account acc : updatedAccounts) {
            if (acc.Gender__c == 'Male') {
                acc.Name = 'Mr '+acc.Name;
            }
            else{
                acc.Name = 'Mrs '+acc.Name;
            }
        }
    }
    
    // Task_9

    public static void Task_9(List<Account> updatedAccounts){
        for (Account acc : updatedAccounts) {
                    if (acc.Name == 'Murtuza') {
                    Id accId = acc.Id;
                    Approval.ProcessSubmitRequest procRequest = new Approval.ProcessSubmitRequest();
                    procRequest.setObjectId(accId);
                    Approval.ProcessResult result = Approval.process(procRequest);
                    Boolean isSuccess = result.isSuccess();            
                    }
                }
    }


    //  Task_10
    public static void Task_10(List<Account> updatedAccounts){
        List<Contact> con = new List<Contact>();
    for (Account acc : updatedAccounts) {
        Contact conList = new Contact();
        conList.LastName = acc.Name;
        conList.AccountId = acc.Id;
        con.add(conList);
    }
    insert con;
    }


    //Task_12
    public static void Task_12(List<Account> updatedAccounts){
        List<String> str = new List<String>();

        for (Account acc_1 : updatedAccounts){
            str.add(acc_1.Name);
        }
        List<Account> accList = [SELECT Id,Name FROM Account WHERE Name=:str];
        List<Account> accDelete = new List<Account>();
        for (Account acc : accList) {
            accDelete.add(acc);
        }   
            delete accDelete;
    }
    // Task_13
    // public static void Task_13(List<Account> updatedAccounts){
    //     for (Account acc : updatedAccounts) {
    //         if (acc.Rating == 'Hot') {
    //             AccountShare accShare = new AccountShare();
    //             accShare.AccountId = acc.Id;
    //             accShare.UserOrGroupId = '0055j000009Vnb3AAC';
    //             accShare.AccountAccessLevel = 'Read';
    //             accShare.OpportunityAccessLevel = 'Read';
    //             insert accShare;
    //         }
    //     }
    // }
}