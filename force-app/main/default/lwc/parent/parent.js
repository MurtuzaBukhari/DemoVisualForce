import { LightningElement } from 'lwc';

export default class Parent extends LightningElement {
    image ="";
    show(event){
        const file = event.target.files[0];
        this.image = URL.createObjectURL(file);
    }
}