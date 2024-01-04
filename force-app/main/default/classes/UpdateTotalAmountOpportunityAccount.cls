public class UpdateTotalAmountOpportunityAccount {
    
    public static void updateTotalOpportunityAmountField(List<Account> accList){
        
        List<Opportunity> opList = [SELECT Id, Amount FROM opportunity WHERE AccountId =: accList[0].Id];
        Double total = 0;
        for(Opportunity o: opList){
            total += o.Amount;
        }
        System.debug(total);
        accList[0].Total_Opportunity_Amount__c = total;
    }
}