@isTest
public class TestgetListAccountFields {
	
    @isTest
    static void PositiveTest(){
    	Account test1 = new Account(Name='Test1',Phone='6735-6723',Industry='Agriculture',Type='Prospect');
    
    	insert test1;
    
        List<String> fieldTest = new List<String>{'Name','Phone'};
            
        List<String> result = getListAccountFields.getSObjectFieldsValue(test1,fieldTest);
        
        System.assertEquals(fieldTest.size(),result.size(),'Positive Test Failed!');
    }
    
}