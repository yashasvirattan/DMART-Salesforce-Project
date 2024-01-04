trigger AccountTrigger on Account (before update, after update, before delete) {
    if(trigger.isUpdate && trigger.isBefore){
        UpdateTotalAmountOpportunityAccount.updateTotalOpportunityAmountField(Trigger.New);
    }
    
    if(trigger.isUpdate && trigger.isAfter){
        UserCountUpdate.updateCountIncrease(trigger.New);
    }
    
    if(trigger.isDelete && trigger.isBefore){
        UserCountUpdate.updateCountDecrease(trigger.Old);
    }
}