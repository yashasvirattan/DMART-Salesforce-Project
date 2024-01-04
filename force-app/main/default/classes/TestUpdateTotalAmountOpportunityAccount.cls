@isTest
public class TestUpdateTotalAmountOpportunityAccount {
	
    @isTest
    static void PositiveTest(){
        Account a = new Account(Name='Test1',Industry='Apparel');
        insert a;
        
        Double exp_res=0;
        List<Opportunity> oppList = new List<Opportunity>();
        for(integer i=0; i<3; i++){
            Opportunity opp = new Opportunity();
            opp.AccountId = a.Id;
            opp.Amount = 20000;
            opp.Name = 'OppTest'+i;
            opp.CloseDate = Date.newInstance(2023,11,24);
            opp.StageName = 'Prospecting';
            exp_res += opp.Amount;
            oppList.add(opp);
            
        }
        insert oppList;
        
        Account upd_a = [SELECT Id, Total_Opportunity_Amount__c FROM Account WHERE Id= :a.Id];
        upd_a.Description = 'Updated for testing';
        update upd_a;
        
        Account final_check = [SELECT Id, Total_Opportunity_Amount__c FROM Account WHERE Id= :a.Id];
        
        System.assertEquals(exp_res,final_check.Total_Opportunity_Amount__c,'Positive Test failed!!');
    }
}