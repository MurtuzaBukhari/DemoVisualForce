import { LightningElement ,track} from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import createContact from '@salesforce/apex/auraContatcCreateTask_1.conCreate';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class CreateContactLwcTask_1 extends LightningElement {
    
    @track name = LASTNAME_FIELD;
    @track number = PHONE_FIELD;
    rec = {
        LastName : this.name,
        Number : this.number
    }
    chnageName(event){
        this.rec.LastName =event.target.value ;
    }
    chnagenumber(event){
        this.rec.Number = event.target.value;
    }
    handleClick(event){
        console.log("Number : "+this.rec.Number);
        console.log("Last Name : "+this.rec.LastName);      
        createContact({
            conLastName : this.rec.LastName,
            conPhoneNumber : this.rec.Number
        })
        .then(result =>{
            this.message = result;
            this.error = undefined;
            if (this.message !== undefined) {
                this.rec.LastName = '';
                this.rec.Number = '';
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'SUCCESS',
                        message: 'Contact Created',
                        variant: 'success',
                    }),
                );
            }
            console.log(JSON.stringify(result));
            console.log("result",this.message);
        })
        .catch(error=>{
            this.message =undefined;
            this.error = error;
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error Accrued',
                    message: error.body.message,
                    variant: 'error',
                }),
            );
            console.log("Error : ",JSON.stringify(this.error));
        });
    }
}