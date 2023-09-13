public class futureApexClass {
    @future(callout = true)
    public static void saveImages(){
        String id1= ApexPages.currentPage().getParameters().get('recordId');
        List<Opportunity> opps = [SELECT Name, Id, AccountId, CloseDate FROM Opportunity WHERE Id = :id1];
        System.debug('Record'+id1);
        // String apiId = '4RVxrpvu7WFvLROekVfbXVpHnBwVsgugO1X0PIz0I-M';
        String endPoint = 'https://api.unsplash.com/photos/random/?client_id=4RVxrpvu7WFvLROekVfbXVpHnBwVsgugO1X0PIz0I-M';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endPoint);
        request.setMethod('GET');
        // request.setHeader('Authorization', 'Client-ID ' + apiId);
        HttpResponse response = http.send(request);
        System.debug('Response'+response);
        System.debug('Body'+response.getBody());
        // if (response.getStatusCode() == 200) {
            Blob imageBlob = response.getBodyAsBlob();
            System.debug('blobBody'+EncodingUtil.Base64Encode(imageBlob));
            // System.debug('blobBody'+Blob.valueOf(response));
            // System.debug('blobBody'+Blob.valueOf(imageBlob));
            // Blob imageBlob = response.getBody();
            System.debug('Image'+imageBlob);
            //  Blob  image = EncodingUtil.Base64Encode(imageBlob);
            // Blob imageBlob = Blob.valueOf(response.getBody());
            Attachment attachment = new Attachment();
            attachment.ParentId = id1;
            attachment.Body = imageBlob;
            attachment.Name = 'RandomImage.png';
            attachment.ContentType = 'image/png';
            insert attachment;
        // }
    }

}
