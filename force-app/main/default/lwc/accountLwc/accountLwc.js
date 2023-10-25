import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';
import { MessageContext, publish } from 'lightning/messageService';
import AccountSelected from '@salesforce/messageChannel/AccountSelected__c';
export default class accountLwc extends LightningElement {
    selectedAccountId;
    accountOptions = [];
    @wire(MessageContext)messageContext;
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

        
        // const message = {
        //     recordId: selectedAccountId
        // };

        let messagePayload = {
            recordId: selectedAccountId
        }; 

        
        publish(this.messageContext, AccountSelected, messagePayload);

        this.selectedAccountId = selectedAccountId;
    }
}
 