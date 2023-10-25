public with sharing class FileUploadController {
    @AuraEnabled
    public static List<ContentVersion> getFiles(String recordId) {
        List<ContentVersion> files = [SELECT Id, Title, ContentDocumentId, ContentSize FROM ContentVersion WHERE FirstPublishLocationId = :recordId];
        return files;
    }
}