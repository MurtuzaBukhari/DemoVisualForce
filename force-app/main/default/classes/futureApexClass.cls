public class futureApexClass {
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
    
            Blob imageBlob = response.getBodyAsBlob();
            System.debug('blobBody'+EncodingUtil.Base64Encode(imageBlob));
            System.debug('Image'+imageBlob);

            Map<String,Object> results= (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
            Map<String,Object> newres = (Map<String,Object>)results.get('urls');
            String imgurl = (String)newres.get('regular');
            System.debug('newres'+ newres);
            System.debug('imgurl'+ imgurl);
            System.debug('results'+ results);


            HttpRequest request_1 = new HttpRequest();
            request_1.setEndpoint(imgurl);
            request_1.setMethod('GET');
            HttpResponse response_1 = http.send(request_1);
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
