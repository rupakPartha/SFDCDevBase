public class AccountProcessor {
    @future
    public static void countContacts(List <Id> accountIds){
    	List<Contact> contactList=[select Id,AccountId from Contact where AccountId in :accountIds ];
        List<Account> accList=[SELECT Active__c,CustomerPriority__c,Id,Match_Billing_Address__c,Name,NumberofLocations__c,Number_of_Contacts__c,SLAExpirationDate__c,SLASerialNumber__c,SLA__c,UpsellOpportunity__c FROM Account];
       
        List<Account> accountList=null;
        for(Account acc: accList){
            System.debug('acc :'+acc);
            integer count=Integer.valueOf(acc.Number_of_Contacts__c);
            for(Contact con : contactList){
                if(con.AccountId==acc.Id){
                    System.debug('count :'+count);
                    acc.Number_of_Contacts__c=count++;
                }
            }
              
        }
        update accList;
    }

}