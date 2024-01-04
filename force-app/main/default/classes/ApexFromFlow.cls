public class ApexFromFlow {
    public class FlowInputs{
        @invocableVariable public String OppId;
        @invocableVariable public Boolean isOld;
    }
    
    @invocableMethod
    public static void updateOpp(List<FlowInputs> request){
        if(request[0].isOld != null && request[0].OppId !=null){
        	String OppId =request[0].OppId;
            Boolean isOld = request[0].isOld;
            //System.debug('Id is: '+OppId);
            Opportunity op = [SELECT Id, Old_Opp__c FROM Opportunity WHERE Id =:OppId];
            //System.debug('Values are: '+op.Id+'    '+op.Old_Opp__c);
            //System.debug('List is '+ op);
            List<Opportunity> res = new List<Opportunity>();
            op.Old_Opp__c = isOld;
            res.add(op);
            update res;  
        }
        
    }
}