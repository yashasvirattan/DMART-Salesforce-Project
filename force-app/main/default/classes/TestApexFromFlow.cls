@isTest
public class TestApexFromFlow {
	
    @isTest
    static void positiveTest(){
        Opportunity o1 = new Opportunity(Name='Test1', CloseDate= Date.newInstance(2023,12,20), StageName='Prospecting');
        insert o1;
        
        List<ApexFromFlow.FlowInputs> newList = new List<ApexFromFlow.FlowInputs>();
        ApexFromFlow.FlowInputs inp = new ApexFromFlow.FlowInputs();
        inp.OppId = o1.Id;
        inp.isOld = true;
        newList.add(inp);
        
        ApexFromFlow.updateOpp(newList);
        
        List<Opportunity> checker = [SELECT Id FROM Opportunity WHERE Id =: inp.OppId AND Old_Opp__c =: inp.isOld];
        System.assertEquals(1,checker.size(),'Positive Test Failed');
    }
    
    @isTest
    static void negativeTest(){
        Opportunity o2 = new Opportunity(Name='Test2', CloseDate= Date.newInstance(2023,12,20), StageName='Prospecting');
        insert o2;
        
        List<ApexFromFlow.FlowInputs> newList1 = new List<ApexFromFlow.FlowInputs>();
        ApexFromFlow.FlowInputs inp1 = new ApexFromFlow.FlowInputs();
        inp1.OppId = o2.Id;
        
        newList1.add(inp1);
        
        ApexFromFlow.updateOpp(newList1);
        
        List<Opportunity> checker1 = [SELECT Id FROM Opportunity WHERE Id =: inp1.OppId AND Old_Opp__c = true];
        System.assertEquals(0,checker1.size(),'Negative Test Failed');
    }
}