public class OpportunityAutoNumber {
    public static void numberIncrease(List<OpportunityLineItem> oppList){
        
        List<AutoNumber_OppLineItem__mdt> datasno = [SELECT MasterLabel,DeveloperName,Serial_Number__c FROM AutoNumber_OppLineItem__mdt];
        if(datasno[0].Serial_Number__c == null){
            datasno[0].Serial_Number__c='0';
        }
        String serialno = datasno[0].Serial_Number__c;
        
        Integer sno = Integer.valueOf(serialno);
        
        for(OpportunityLineItem opp : oppList){
            sno++;
            opp.Serial_Number__c = String.valueOf(sno);
            serialno = opp.Serial_Number__c;
        }
        
        updateMetadata(serialno);
        
    }
    
    @future
    public static void updateMetadata(String sno){
        List<AutoNumber_OppLineItem__mdt> datasno = [SELECT MasterLabel,DeveloperName,Serial_Number__c FROM AutoNumber_OppLineItem__mdt];
        Metadata.DeployContainer mdContainer = new Metadata.DeployContainer();
        Metadata.CustomMetadata metadataRec =  new Metadata.CustomMetadata();
        metadataRec.fullName = 'AutoNumber_OppLineItem__mdt.'+datasno[0].DeveloperName;
        metadataRec.label = datasno[0].MasterLabel;
        //System.debug('metadataRec.fullName: '+ metadataRec.fullName);
        
        Metadata.CustomMetadataValue customFieldtoUpdate = new Metadata.CustomMetadataValue();
        customFieldtoUpdate.field = 'Serial_Number__c';
        customFieldtoUpdate.value = sno;
        
        metadataRec.values.add(customFieldtoUpdate);
        mdContainer.addMetadata(metadataRec);
        Metadata.Operations.enqueueDeployment(mdContainer,null);
    }
}