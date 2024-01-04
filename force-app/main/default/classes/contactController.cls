public with sharing class contactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getRecords(){
        return [SELECT FirstName, LastName, Email FROM Contact];
    }

    @AuraEnabled
    public static string duplication(Object record){
        System.debug('In duplication contact method');
        System.debug('Contact is: '+record);
        
        String ans1 = JSON.serialize(record);

        List<Contact> con = (List<Contact>)(JSON.deserialize(ans1, List<Contact>.class));

        List<Contact> allContacts = new List<Contact>();
        for(Contact c:con){
            Contact c1 = new Contact(FirstName = c.FirstName, LastName = c.LastName, Email = c.Email);
             allContacts.add(c1);  
        }
        insert allContacts;

        return 'Successfully duplicated';
    }

}