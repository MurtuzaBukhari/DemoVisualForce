trigger Task_13 on Account (after update) {
    for (Account acc : Trigger.new) {
        if (acc.Rating == 'Hot') {
            AccountShare accShare = new AccountShare();
            accShare.AccountId = acc.Id;
            accShare.UserOrGroupId = '0055j000009Vnb3AAC';
            accShare.AccountAccessLevel = 'Read';
            accShare.OpportunityAccessLevel = 'Read';
            insert accShare;
        }
    }
}   
