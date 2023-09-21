public class futureApexClass {
    public class UrlWrapper {
        public Urls urls; // Make sure this property is defined correctly.
    }
    
    public class Urls {
        public String regular;
    }
    @future(callout = true)
    public static void saveImages(){
            String id1= ApexPages.currentPage().getParameters().get('recordId');
            List<Opportunity> opps = [SELECT Name, Id, AccountId, CloseDate FROM Opportunity WHERE Id = :id1];
            System.debug('Record'+id1);
            String endPoint = 'https://api.unsplash.com/photos/random/?client_id=4RVxrpvu7WFvLROekVfbXVpHnBwVsgugO1X0PIz0I-M';
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint(endPoint);
            request.setMethod('GET');   
            HttpResponse response = http.send(request);
            System.debug('Response'+response);
            System.debug('Body'+response.getBody());
    
            // Blob imageBlob = response.getBodyAsBlob();
            // System.debug('blobBody'+EncodingUtil.Base64Encode(imageBlob));
            // System.debug('Image'+imageBlob);

            UrlWrapper wrapper = (UrlWrapper)System.JSON.deserialize(response.getBody(), UrlWrapper.class);
            String imgurl_1 = wrapper.urls.regular;
            System.debug('wrapper'+wrapper);
            System.debug('imgurl_1'+imgurl_1);



            HttpRequest request_1 = new HttpRequest();
            request_1.setEndpoint(imgurl_1);
            request_1.setMethod('GET');
            HttpResponse response_1 = http.send(request_1);
            System.debug('Response'+response_1);
            Blob img = response_1.getBodyAsBlob();
            System.debug('Img'+img);

            Attachment attachment = new Attachment();
            attachment.ParentId = id1;
            attachment.Body = img;
            attachment.Name = 'RandomImage.png';
            attachment.ContentType = 'image/png';
            insert attachment;
        }
}
