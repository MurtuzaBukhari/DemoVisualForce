
public class ErrorLogClass {
    // Method to create an Exception record
    public static void createExceptionLog(String className, String exceptionMessage, Integer lineNumber, String methodName, String exceptionType, String moreDetails) {
        try {
            Error_Log__c errorLog = new Error_Log__c(
                Class_Name__c = className,
                Exception_Message__c = exceptionMessage,
                Line_Number__c = lineNumber,
                Method_Name__c = methodName,
                Exception_Type__c = exceptionType,
                More_Details__c = moreDetails
            );

            insert errorLog;
        } catch(Exception e) {
            // Handle any errors that occur during record creation, e.g., log them or notify administrators.
            System.debug('Error creating Exception Log: ' + e.getMessage());
        }
    }
}
