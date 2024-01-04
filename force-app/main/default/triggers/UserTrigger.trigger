trigger UserTrigger on User (before insert, after insert) {
    if(trigger.isInsert && trigger.isAfter){
        Set<Id> userIds = new Set<Id>();
        Profile salesProfile = [SELECT Id From Profile WHERE Name='Custom: Sales Profile' LIMIT 1];
        for(User u: Trigger.new){
            if(u.ProfileId == salesProfile.Id){
                userIds.add(u.Id);
            }
        }
        if(userIds != null){
            UserPermissionsetAssign.customSalesPermission(userIds);
        }
    }
}