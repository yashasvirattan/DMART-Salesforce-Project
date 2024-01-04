public class ApexFromFlowAccounts {
    public class AccountFlowInput{
        @invocableVariable public String Name;
        @invocableVariable public String Phone;
        @invocableVariable public String Industry;
        @invocableVariable public String Address;
        @invocableVariable public String Rating;
        @invocableVariable public String CustomerPriority;
    }
    
    public class Result{
        @invocableVariable public String mes;
    }
    
    @invocableMethod
    public static List<Result> Account_Create(List<AccountFlowInput> acc){
        List<Result> final1 = new List<Result>();
        try{
            Account anew = new Account();
            for(AccountFlowInput a: acc){
                anew.Name = a.Name;
                anew.Phone = a.Phone;
                anew.Industry = a.Industry;
                anew.BillingStreet = a.Address;
                anew.Rating = a.Rating;
                anew.CustomerPriority__c = a.CustomerPriority;
            }
            insert anew;
            Result res = new Result();
            
            res.mes = 'Success!'+ anew.Id +anew.Phone;
            final1.add(res);
        }
        catch(Exception e){
            Result res = new Result();
            res.mes = 'Error is: '+ e.getMessage();
            final1.add(res);
        }
        return final1;
    }
}