// trigger Task_9 on Account (after insert, after update) {
//     for (Account acc : Trigger.new) {
//         if (acc.Name == 'Murtuza') {
//         Id accId = acc.Id;
//         Approval.ProcessSubmitRequest procRequest = new Approval.ProcessSubmitRequest();
//         procRequest.setObjectId(accId);
//         Approval.ProcessResult result = Approval.process(procRequest);
//         Boolean isSuccess = result.isSuccess();            
//         }
//     }
// }