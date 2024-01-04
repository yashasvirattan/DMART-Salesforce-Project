import { api, LightningElement, wire } from 'lwc';
import records from '@salesforce/apex/merchandiseController.getMerch';
import { refreshApex } from "@salesforce/apex";

import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import deleteMerch from '@salesforce/apex/merchandiseController.deleteMerch';

export default class DeleteMerchandise extends LightningElement {

    selectedRows;

    @wire(records)
    merchproduct;

    merchproductColumns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Stocks', fieldName: 'Merchandise_Stock__c' },
        { label: 'Price', fieldName: 'Merchandise_Price__c' },
    ];
    
    getSelectedName(event) {
        this.selectedRows = event.detail.selectedRows;
        console.log(this.selectedRows);
        console.log(typeof this.selectedRows);
    }

    handleDelete(){
        const recordIds = this.selectedRows.map(r => r.Id);
        console.log('In handle Delete   ', recordIds);
        deleteMerch({deleter: recordIds})
        .then((data) => {
            const sToast = new ShowToastEvent({
                title: "Success",
                message: "Record successfully deleted",
                variant: "success"
            });
            this.dispatchEvent(sToast);
            refreshApex(this.merchproduct);
        })
        .catch((error) => {
            console.log(error);
        })
    }
}