import { api, LightningElement, wire} from 'lwc';
import Merchandise__c from '@salesforce/schema/Merchandise__c';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import {refreshApex} from '@salesforce/apex';
import records from '@salesforce/apex/merchandiseController.getMerch';

export default class AddMerchandiseProduct extends LightningElement {

    @api
    recordId = Merchandise__c;

    @wire(records)
    records;

    sToast = new ShowToastEvent({
        title: "Success",
        message: "Record successfully added",
        variant: "success"
    });

    handleLoad(event){
        console.log(event.type);
        console.log(event.details);
    }
    handleSubmit(event){
        console.log(event.type);
        console.log(event.details); 
    }
    handleSuccess(event){        
        console.log(event.type);        
        console.log(event.details);        
        console.log(event.detail.id);        
        // var msg = "Merchandise added";      
        // alert(msg);
        this.dispatchEvent(this.sToast);
        refreshApex(this.records);
    }

    handleError(event){
        console.log(event.type);
        console.log(event.details);
    }
    
}