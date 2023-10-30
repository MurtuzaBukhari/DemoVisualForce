public class gmailIntegration{
    @AuraEnabled
    public static void setRecord(String mailBody,String mailSubject,Blob img,String conId,String fileName) {
        System.debug('Name : '+fileName);
        List<Contact> conList = [SELECT Email FROM Contact WHERE Id=:conId];
        String  email;
        for (Contact con : conList)
        {
            email = (String)con.get('Email');
        }

        HttpRequest req = new HttpRequest();
        String toAddress = email;
        String subject = mailSubject;
        String Body = mailBody;
        System.debug('Address : '+ toAddress);
        System.debug('Subject : '+ subject);
        System.debug('Body : '+Body);
        String mbody = '{ "raw" : "' + EncodingUtil.base64Encode(Blob.valueof( 'To: ' + toAddress + '\r\nContent-Type:text/plain; charset=utf-8;\r\nSubject: ' + subject + '\r\n\r\n' + Body )) + '"}';
        req.setHeader('Content-Length', mbody.length()+'');
        req.setHeader('Content-Type', 'application/json');
        req.setEndpoint('callout:Gmail_API/gmail/v1/users/bukharimurtuza3@gmail.com/messages/send');
        req.setMethod('POST');
        req.setBody(mbody);
        Http h = new Http();
        HttpResponse res = h.send(req);
        system.debug(res);

        Attachment attachment = new Attachment();
        attachment.ParentId = conId;
        attachment.Body = img;
        attachment.Name = fileName;
        attachment.ContentType = 'image/png';
        insert attachment;
    }
}

