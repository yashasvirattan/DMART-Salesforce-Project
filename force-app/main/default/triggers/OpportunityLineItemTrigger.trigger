trigger OpportunityLineItemTrigger on OpportunityLineItem (before insert) {

    if(trigger.isInsert && trigger.isBefore){
        OpportunityAutoNumber.numberIncrease(Trigger.new);
    }
}