import { LightningElement, track } from 'lwc';
import getRecords from '@salesforce/apex/wizardController.getRecords';
import mailsend from '@salesforce/apex/wizardController.mailsend';
export default class WizardLwc extends LightningElement {
    @track showSection1 = true;
    @track showSection2 = false;
    @track showSection3 = false;
    @track showSection4 = false;
    @track objectOptions = [
        { label: 'Lead', value: 'Lead' },
        { label: 'Account', value: 'Account' },
        { label: 'Contact', value: 'Contact' }
    ];
    @track selectedObject = '';
    @track selectedId = '';
    @track emailSubject='';
    @track emailBody='';
    @track records = []; 

    get showPrevious() {
        return this.showSection2 || this.showSection3  || this.showSection4;
    }

    get showNext() {
        return this.showSection1 || this.showSection2  || this.showSection3;
    }
    get showFinish(){
        return this.showSection4;
    }

    handleObjectChange(event) {
        this.selectedObject = event.detail.value;
        console.log("Objects : "+this.selectedObject);
        this.fetchRecords();
    }
    
    fetchRecords() {
        getRecords({ objectName: this.selectedObject })
            .then(result => {
                this.records = result;
            })
            .catch(error => {
               
                console.error('Error fetching records: ' + error);
            });
    }
    

    handlePrevious() {
        if (this.showSection2) {
            this.showSection1 = true;
            this.showSection2 = false;
        } else if (this.showSection3) {
            this.showSection2 = true;
            this.showSection3 = false;
        }
        else if (this.showSection4) {
            this.showSection3 = true;
            this.showSection4 = false;
        }
    }
    pickChange(event){       
        // if (event.target.checked == true) {
            console.log("Checked : "+event.target.checked);
            this.selectedId = event.target.value;
            console.log("Id : "+this.selectedId);
        // }
    }
    subMail(event){
        this.emailSubject = event.target.value;
        // console.log("Subject : "+this.emailSubject);
    }
    bodyMail(event){
        this.emailBody = event.target.value;
        // console.log("Body : "+this.emailBody);
    }
    handleNext() {
        if (this.showSection1) {
            console.log("Object 2 :: "+this.selectedObject);
            if (this.selectedObject == null || this.selectedObject == "" ) {
            alert("First Select any Object")
        }else{
            this.showSection1 = false;
            this.showSection2 = true;
        } 
            
        } else if (this.showSection2) {
            if (this.selectedId == null || this.selectedId == "") {
                alert("Select any one Record")
            }
            else{
                this.showSection2 = false;
                this.showSection3 = true;
            }
            
        }
        else if (this.showSection3) {
            if ((this.emailSubject == null || this.emailSubject == "") || (this.emailBody == null || this.emailBody == "") ) {
                alert("Subject and body both are required!!");
            }
            else{
                this.showSection3 = false;
                this.showSection4 = true;
            }
        }
    }
    handleFinish(event){
        console.log("Id : "+this.selectedId);
        console.log("subject : "+this.emailSubject);
        console.log("body : "+this.emailBody);
        mailsend({
            objId: this.selectedId,
            mailSubject:this.emailSubject,
            mailBody: this.emailBody,
            objectName: this.selectedObject 
        })
    }
}
