import { api, LightningElement, wire } from 'lwc';
import records from '@salesforce/apex/merchandiseController.getMerch';
import {refreshApex} from '@salesforce/apex';


export default class ViewMerchandiseRecord extends LightningElement {

    @wire(records)
    merchproduct;

    merchproductColumns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Description', fieldName: 'Merchandise_Desc__c' },
        { label: 'Country', fieldName: 'Merchandise_Country__c' },
        { label: 'State', fieldName: 'Merchandise_States__c' },
        { label: 'Price', fieldName: 'Merchandise_Price__c' },
        { label: 'Stock', fieldName: 'Merchandise_Stock__c' },
    ];

    @api
    handleRefresh(){
        refreshApex(this.merchproduct);
    }

}