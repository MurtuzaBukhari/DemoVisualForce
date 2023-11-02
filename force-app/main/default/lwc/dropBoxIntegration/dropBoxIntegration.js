import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import setRecord from '@salesforce/apex/dropBoxIntegration.getRecord';
export default class DropBoxIntegration extends LightningElement {
    image;
    fileData;
    @api recordId;
    show(event){
        let file = event.target.files[0];
        console.log("Files :",file);
        var reader = new FileReader()
        reader.onload = () => {
            var base64 = reader.result.split(',')[1]
            this.fileData = {
                'filename': file.name,
                'base64': base64,
                'recordId': this.recordId
            }
            console.log("Data : ",this.fileData)
        }
        reader.readAsDataURL(file)
    }
    handleClick(){
        const {base64, filename, recordId} = this.fileData
        setRecord({ base64, filename, recordId }).then(result=>{
            this.fileData = null
            let title = `${filename} uploaded successfully!!`
            this.toast(title)
        })
    }
    toast(title){
        const toastEvent = new ShowToastEvent({
            title, 
            variant:"success"
        })
        this.dispatchEvent(toastEvent)
    }
}