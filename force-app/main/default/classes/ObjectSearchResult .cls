public with sharing class ObjectSearchResult {
    @AuraEnabled
    public String objectName { get; set; }
    @AuraEnabled
    public List<ObjectSearchResultRecord> records { get; set; }

    public ObjectSearchResult(String objectName, List<ObjectSearchResultRecord> records) {
        this.objectName = objectName;
        this.records = records;
    }
}

public with sharing class ObjectSearchResultRecord {
    @AuraEnabled
    public Id id { get; set; }
    @AuraEnabled
    public String name { get; set; } // Modify this field based on your object's schema
    // Add more fields as needed

    public ObjectSearchResultRecord(Id id, String name) {
        this.id = id;
        this.name = name;
    }
}
