trigger Task_13 on Account (after update) {
    List<AccountShare> shareList = new List<AccountShare>();
    for (Account acc : Trigger.new) {
        if (acc.Rating == 'Hot') {
            AccountShare accShare = new AccountShare();
            accShare.AccountId = acc.Id;
            accShare.UserOrGroupId = '0055j000009VnnDAAS';
            accShare.AccountAccessLevel = 'Edit';
            accShare.OpportunityAccessLevel = 'Read';
            shareList.add(accShare);    
        }
    }
    insert shareList;
}   