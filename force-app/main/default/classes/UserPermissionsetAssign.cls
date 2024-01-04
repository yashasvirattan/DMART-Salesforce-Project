public class UserPermissionsetAssign {
    
    @future
    public static void customSalesPermission(Set<Id> userIds){
        
        PermissionSet pSet = [SELECT Id FROM PermissionSet WHERE Name='Sales_User_Permissions'];
        
        List<PermissionSetAssignment> assign = new List<PermissionSetAssignment>();
        if(pSet != null){
            for(Id uid: userIds){
            	assign.add(new PermissionSetAssignment(PermissionSetId = pSet.Id, AssigneeId = uid));
        	}
        }
        if(assign != null){
            insert assign;
            System.debug('Ran Successfully!!');
        }
        
    }
}