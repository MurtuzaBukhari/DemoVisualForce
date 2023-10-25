import { LightningElement, track } from 'lwc';
import getRecords from '@salesforce/apex/wizardController.getRecords';
export default class WizardLwc extends LightningElement {
    @track showSection1 = true;
    @track showSection2 = false;
    @track showSection3 = false;
    @track objectOptions = [
        { label: 'Lead', value: 'Lead' },
        { label: 'Account', value: 'Account' },
        { label: 'Contact', value: 'Contact' }
    ];
    @track selectedObject = '';
    @track records = []; 

    get showPrevious() {
        return this.showSection2 || this.showSection3;
    }

    get showNext() {
        return this.showSection1 || this.showSection2;
    }

    handleObjectChange(event) {
        this.selectedObject = event.detail.value;
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
    }

    handleNext() {
        if (this.showSection1) {
            this.showSection1 = false;
            this.showSection2 = true;
        } else if (this.showSection2) {
            this.showSection2 = false;
            this.showSection3 = true;
        }
    }
}
