@isTest
public class TestApexFromFlowAccounts {
	
    @isTest
    static void positiveTest(){
        
        List<ApexFromFlowAccounts.AccountFlowInput> inp = new List<ApexFromFlowAccounts.AccountFlowInput>();
        ApexFromFlowAccounts.AccountFlowInput acc = new ApexFromFlowAccounts.AccountFlowInput();
        acc.Name = 'Test1';
        acc.Industry = 'Agriculture';
        acc.Address = 'Delhi';
        acc.Rating = 'Hot';
        acc.CustomerPriority = 'High';
        acc.Phone = '1234-4321';
        inp.add(acc);
        
        List<ApexFromFlowAccounts.Result> res = ApexFromFlowAccounts.Account_Create(inp);
        
        Account check = [SELECT Id,Phone FROM Account WHERE Name =:acc.Name AND Phone =:acc.Phone];
        
        List<ApexFromFlowAccounts.Result> checkres = new List<ApexFromFlowAccounts.Result>();
        
        ApexFromFlowAccounts.Result res1 = new ApexFromFlowAccounts.Result();
        res1.mes = 'Success!'+ check.Id+check.Phone;
        checkres.add(res1);
        
        System.assertEquals(checkres[0].mes,res[0].mes,'Postive Test Failed!!'); 
    }
    
    @isTest
    static void negativeTest(){
        
        List<ApexFromFlowAccounts.AccountFlowInput> inp1 = new List<ApexFromFlowAccounts.AccountFlowInput>();
        ApexFromFlowAccounts.AccountFlowInput acc1 = new ApexFromFlowAccounts.AccountFlowInput();
        //acc1.Name = 'Test2';
        acc1.Industry = 'Agriculture';
        acc1.Address = 'Delhi';
        acc1.Rating = 'Hot';
        acc1.CustomerPriority = 'High';
        acc1.Phone = '7634-6351';
        inp1.add(acc1);
        
        List<ApexFromFlowAccounts.Result> res1 = ApexFromFlowAccounts.Account_Create(inp1);
        
        List<ApexFromFlowAccounts.Result> checkres1 = new List<ApexFromFlowAccounts.Result>();
        
        ApexFromFlowAccounts.Result res12 = new ApexFromFlowAccounts.Result();
        res12.mes = 'Error is: Insert failed. First exception on row 0; first error: REQUIRED_FIELD_MISSING, Required fields are missing: [Name]: [Name]';
        checkres1.add(res12);
        
        System.assertEquals(checkres1[0].mes,res1[0].mes,'Negative Test Failed!!'); 
    }
}