//Create a field on User Object "Count", 
//On Account update Increment 1 in update count field and on delete of account decrement count 1
public class UserCountUpdate {

    public static void updateCountIncrease(List<Account> acc){
        User u;
        for(Account a: acc){
        	u = [SELECT Id,Count__c FROM User WHERE Id = :a.OwnerId];
            if(u.Count__c == null){
                u.Count__c =1;
            }
            else{
                u.Count__c++;
            }
        }
        update u;
    }
    public static void updateCountDecrease(List<Account> acc){
        User u;
        Integer i =0;
        for(Account a: acc){
            i++;
            System.debug(i);
        	u = [SELECT Id,Count__c FROM User WHERE Id = :a.OwnerId];
            if(u.Count__c == null){
                u.Count__c =-1;
            }
            else{
                u.Count__c--;
            }
        }
        update u;
    }
}