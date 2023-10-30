public with sharing class pickSearch{
    @AuraEnabled(cacheable=true)
    public static List<ObjectSearchResult> performSOSLSearch(String soslQuery) {
        // Perform the SOSL search and return the results
        List<ObjectSearchResult> searchResults = new List<ObjectSearchResult>();

        List<List<SObject>> searchList = [FIND :soslQuery IN ALL FIELDS RETURNING Account(Id, Name), Contact(Id, FirstName, LastName)];

        for (List<SObject> sobjects : searchList) {
            String objectName = String.valueOf(sobjects[0].getSObjectType());
            List<ObjectSearchResultRecord> records = new List<ObjectSearchResultRecord>();
            
            for (SObject record : sobjects) {
                ObjectSearchResultRecord resultRecord = new ObjectSearchResultRecord(
                    (Id)record.get('Id'),
                    (String)record.get('Name'), // Modify this field based on your object's schema
                    // Add more fields as needed
                );
                records.add(resultRecord);
            }
            
            if (!records.isEmpty()) {
                searchResults.add(new ObjectSearchResult(objectName, records));
            }
        }

        return searchResults;
    }
}


