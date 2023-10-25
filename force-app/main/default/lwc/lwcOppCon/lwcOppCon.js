import { LightningElement, wire } from 'lwc';
import { subscribe, unsubscribe, MessageContext } from 'lightning/messageService';
import ACCOUNT_SELECTED_MESSAGE from '@salesforce/messageChannel/AccountSelected__c';
import getRelatedData from '@salesforce/apex/RelatedDataController.getRelatedData';

export default class lwcOppCon extends LightningElement {
    selectedAccountId;
    contacts = [];
    opportunities = [];
    subscription;

    @wire(MessageContext)
    messageContext;

    connectedCallback() {
        this.subscription = subscribe(
            this.messageContext,
            ACCOUNT_SELECTED_MESSAGE,
            (message) => this.handleAccountSelection(message)
        );
    }

    disconnectedCallback() {
        unsubscribe(this.subscription);
    }

    handleAccountSelection(message) {
        this.selectedAccountId = message.recordId;
        this.loadRelatedData();
    }

    loadRelatedData() {
        if (this.selectedAccountId) {
            getRelatedData({ accountId: this.selectedAccountId })
                .then((result) => {
                    this.contacts = result.contacts;
                    this.opportunities = result.opportunities;
                })
                .catch((error) => {
                    console.error('Error loading related data: ', error);
                });
        } else {
            this.contacts = [];
            this.opportunities = [];
        }
    }
}
