public class getListAccountFields {
    public static List<String> getSObjectFieldsValue(Account record, List<String> fields){
        Integer l = fields.size();
        System.debug('Size is: '+l);
        System.debug('All records are: '+record);
        List<String> result = new List<String>();
        for(String a: fields){
            String r =  String.valueof(record.get(a));
            result.add(r);
        }
        System.debug('Filtered rows are: '+result);
        return result;
    }
}

//List<Account> acc= [SELECT Id,Name,Annualrevenue,BillingAddress,Industry FROM Account];
//Account record = acc[0];
//List<String> fields = new List<String>{'Name','Industry'};
//getListAccountFields.getSObjectFieldsValue(record, fields);