public with sharing class merchandiseController {
    @AuraEnabled(cacheable=true)
    public static List<Merchandise__c> getMerch(){
        return [select Name,Merchandise_Desc__c,Merchandise_Country__c,Merchandise_States__c,Merchandise_Stock__c,
        Merchandise_Price__c from Merchandise__c];
    }

    @AuraEnabled
    public static List<Merchandise__c> searchMerch(String str){
        String key = str + '%';
        return [SELECT Name, Merchandise_Stock__c, Merchandise_Country__c, Merchandise_States__c, Merchandise_Price__c FROM Merchandise__c
        WHERE Name LIKE: key];
    }

    @AuraEnabled
    public static String deleteMerch(List<Id> deleter){
        
        List<Merchandise__c> saver = [SELECT Id FROM Merchandise__c WHERE Id IN: deleter];
        delete saver;
        return 'Deleted Succcessfully';
    }
}