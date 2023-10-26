import { LightningElement, track, wire } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { search, showToast } from 'c/utils';

export default class multiPickList extends LightningElement {
    @track searchTerm = '';
    @track selectedObjects = [];
    @track objectOptions = []; 
    @track searchResults = [];

    @wire(getObjectInfo)
    objectInfo({ data, error }) {
        if (data) {
            
            const availableObjects = Object.values(data).map((object) => ({
                label: object.apiName,
                value: object.apiName,
            }));

            
            this.objectOptions = availableObjects;
        } else if (error) {
            showToast('Error fetching object information', 'error');
        }
    }
    handleSearchTermChange(event) {
        this.searchTerm = event.target.value;
    }

    handleObjectSelection(event) {
        this.selectedObjects = event.detail.value;
    }

    async handleSearch() {
        if (this.selectedObjects.length === 0) {
            showToast('Select at least one object to search', 'error');
            return;
        }

        
        const soslQuery = `FIND {*${this.searchTerm}*} IN ALL FIELDS RETURNING ${this.selectedObjects.join()}`;

        try {
           
            const searchResults = await search(soslQuery);

            
            this.searchResults = searchResults.map((result) => ({
                objectName: result.objectName,
                records: result.records,
                columns: result.columns,
            }));
        } catch (error) {
            showToast('Error occurred during search', 'error');
        }
    }
}
