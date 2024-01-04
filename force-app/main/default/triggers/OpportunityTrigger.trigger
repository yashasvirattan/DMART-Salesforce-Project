trigger OpportunityTrigger on Opportunity (after update) {

    if(trigger.isUpdate && trigger.isAfter){
        AccountClientContactUpdate.updateOppClientContact(trigger.New);
    }
}