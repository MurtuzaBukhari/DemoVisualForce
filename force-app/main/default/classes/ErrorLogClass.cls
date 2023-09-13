public class ErrorLogClass {
    // Method to create an Exception record
    public static void createExceptionLog(String cName, String eMessage, Integer lNumber, String mName, String eType, String mDetails) {
        
            Error_Log__c errorLog = new Error_Log__c(
                Class_Name__c = cName,
                Exception_Message__c = eMessage,
                Line_Number__c = lNumber,
                Method_Name__c = mName,
                Exception_Type__c = eType,
                More_Details__c = mDetails
            );

            insert errorLog;
       
    }
}
