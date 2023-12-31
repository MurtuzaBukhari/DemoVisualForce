import { LightningElement,api} from 'lwc';
import setRecord from '@salesforce/apex/gmailIntegration.setRecord';
export default class GmailIntegration extends LightningElement {
    subjectMail;
    bodyMail;
    image;
    fileName;
    str;
    // base64;
    @api recordId;
    subChange(event){
        this.subjectMail = event.target.value;
    }
    boChange(event){
        this.bodyMail = event.target.value;
    }
    show(event){
        let file = event.target.files[0];
        console.log("Files :",file);
        this.image = URL.createObjectURL(file);
        console.log("URL : ",this.image);
        this.fileName = file.name;
    }
    handleClick(event){
        console.log("recordId : "+this.recordId);
        console.log("Subject : "+this.subjectMail);
        console.log("Body : "+this.bodyMail);
        console.log("Name : "+this.fileName);
    
        setRecord({
            mailBody : this.bodyMail,
            mailSubject : this.subjectMail,
            img : this.image,
            conId : this.recordId,
            fileName : this.fileName
        })
    }
}