import { LightningElement} from 'lwc';
import searchMerch from '@salesforce/apex/merchandiseController.searchMerch';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class SearchMerchandise extends LightningElement {

    records;
    key;
    error;

    handleChange(event){
        console.log('in change');
        this.key = event.target.value;
        console.log(this.key);
        this.records = undefined;
        
    }

    handleClick(){
        if(this.key != null && this.key != ''){
            searchMerch({str: this.key})
            .then((result) => {
                console.log(JSON.serialize(result));
                if(result != null && result!=''){
                this.records = result;
                this.error = undefined;
                }
                else{
                    this.dispatchEvent(this.sToast);        
                }
            })
            .catch((error) => {
                this.error = error;
                this.records = undefined;
            });
        }
        else{
            this.dispatchEvent(this.sToast);
        }  
    }

    sToast = new ShowToastEvent({
        title: "Error",
        message: "Enter Merchandise Name Correctly!",
        mode: "dismissable",
        variant: "error"
    });
        
}