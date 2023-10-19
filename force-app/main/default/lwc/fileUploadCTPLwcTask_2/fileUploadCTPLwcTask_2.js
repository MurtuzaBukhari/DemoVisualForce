import { LightningElement } from 'lwc';

export default class FileUploadCTPLwcTask_2 extends LightningElement {
    image ="";
    show(event){
        const file = event.target.files[0];
        this.image = URL.createObjectURL(file);
    }
}