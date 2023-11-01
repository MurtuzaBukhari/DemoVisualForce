public class gmailIntegration{
    @AuraEnabled
    public static void setRecord(String mailBody,String mailSubject,Blob img,String conId,String fileName) {
        List<Contact> conList = [SELECT Email FROM Contact WHERE Id = :conId];
        String email;
        for (Contact con : conList) {
            email = (String) con.get('Email');
        }
        HttpRequest req = new HttpRequest();
        String toAddress = email;
        String subject = mailSubject;
        String Body = mailBody;
        System.debug('mailaddress==>' + toAddress);
        System.debug('subject==>' + subject);
        System.debug('body==>' + Body);
        System.debug('blob==>' + img);
        String mbody = '{ "raw" : "' + EncodingUtil.base64Encode(Blob.valueOf('To: ' + toAddress + '\r\nContent-Type:text/plain; charset=utf-8;\r\nSubject: ' + subject + '\r\n\r\n' + Body)) + '"}';
        req.setHeader('Content-Length', String.valueOf(mbody.length()));
        req.setHeader('Content-Type', 'application/json');
        req.setEndpoint('callout:Gmail_API/upload/gmail/v1/users/bukharimurtuza3@gmail.com/messages/send?uploadType=media');
        req.setMethod('POST');
        req.setBody(mbody);
        Http h = new Http();
        HttpResponse res = h.send(req);
    }
}

