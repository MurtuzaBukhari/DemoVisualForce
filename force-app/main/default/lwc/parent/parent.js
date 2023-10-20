import { LightningElement } from 'lwc';

export default class Parent extends LightningElement {
    image ="";
    show(event){
        const file = event.target.files[0];
        console.log("Name : ",file.name);
        this.image = URL.createObjectURL(file);
    }
}