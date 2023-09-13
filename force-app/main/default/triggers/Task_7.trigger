// trigger Task_7 on Account (before insert) {
//     for (Account acc : Trigger.new) {
//         if (acc.Gender__c == 'Male') {
//             acc.Name = 'Mr '+acc.Name;
//         }
//         else{
//             acc.Name = 'Mrs '+acc.Name;
//         }
//     }
// }