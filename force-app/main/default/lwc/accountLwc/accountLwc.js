import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';

export default class accountLwc extends LightningElement {
    selectedAccountId;
    accountOptions = [];

    @wire(getAccounts)
    wiredAccounts({ error, data }) {
        if (data) {
            this.accountOptions = data.map(account => ({
                label: account.Name,
                value: account.Id
            }));
        } else if (error) {
            
        }
    }

    handleAccountSelection(event) {
        const selectedAccountId = event.detail.value;

        
        const message = {
            recordId: selectedAccountId
        };

        const messagePayload = {
            recordId: selectedAccountId
        };

        
        publish(this.messageContext, ACCOUNT_SELECTED_MESSAGE, messagePayload);

        this.selectedAccountId = selectedAccountId;
    }
}
