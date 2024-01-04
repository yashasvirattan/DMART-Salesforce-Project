@isTest
public class TestUserPermissionsetAssign {
	public static User createUser(String fName, String lName, String alias, Profile profile) {
        User usr = new User(LastName = lName,
                            FirstName = fName,
                            Alias = alias,
                            Email = fName + '.' + lName + '@apexstepbystep.com',
                            Username = 'test.user444@apexstepbystep.com',
                            ProfileId = profile.id,
                            TimeZoneSidKey = 'GMT',
                            LanguageLocaleKey = 'en_US',
                            EmailEncodingKey = 'UTF-8',
                            LocaleSidKey = 'en_US'
                           );
        return usr;
    }
    
    @isTest
    static void testForSalesLicense(){
        Profile prf = [SELECT Id FROM Profile WHERE Name='Custom: Sales Profile' LIMIT 1];
        User u1 = TestUserPermissionsetAssign.createUser('Test1','Tester1test','tt1user',prf);
        
        Test.startTest();
        insert u1;
        Test.stopTest();
        
        PermissionSet set1 = [SELECT Id FROM PermissionSet WHERE Name='Sales_User_Permissions' LIMIT 1];
        List<PermissionSetAssignment> psa1 = [SELECT Id FROM PermissionSetAssignment WHERE PermissionSetId =:set1.Id AND AssigneeId =:u1.Id];
        System.debug(psa1.size());
        System.assertEquals(1,psa1.size(),'Permission sets are not in order, Positivie test failing');
        
    }
    
    //@isTest
    testmethod static void testNegativeForSetAssignment(){
        Profile prf2 = [SELECT Id FROM Profile WHERE Name='Standard User' LIMIT 1];
        User u2 = TestUserPermissionsetAssign.createUser('Test2','Tester2test','tt2user',prf2);
        
        Test.startTest();
        insert u2;
        Test.stopTest();
        
        PermissionSet set2 = [SELECT Id FROM PermissionSet WHERE Name='Sales_User_Permissions' LIMIT 1];
        List<PermissionSetAssignment> psa2 = [SELECT Id FROM PermissionSetAssignment WHERE PermissionSetId =:set2.Id AND AssigneeId =:u2.Id];
        System.assertEquals(0,psa2.size(),'Negative test failing!!');
    }
}