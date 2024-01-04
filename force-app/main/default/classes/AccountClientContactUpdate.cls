//Create a fields on Opportunity Client Contact, 
//Once an Opportunity client Contact update then update Account client contact with same on Opportunity Client Contact
public class AccountClientContactUpdate {
    public static void updateOppClientContact(List<Opportunity> opp){
        
        Account a;
        for(Opportunity o: opp){
            a = [SELECT Id,Client_Contact__c FROM Account WHERE Id = :o.AccountId Limit 1];
            a.Client_Contact__c = o.Client_Contact__c;
        }
        update a;
    }
}