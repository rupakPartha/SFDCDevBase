@RestResource(urlMapping='/Accounts/*')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String s_url = request.requestURI.substring(0,
          request.requestURI.lastIndexOf('/'));
        System.debug('Account ID1 : '+request.requestURI);
        String accId=s_url.substring(s_url.lastIndexOf('/')+1);
        System.debug('Account ID : '+accId);
        Account result =  [SELECT id,name,(SELECT ID,Name from Contacts)
                        FROM Account
                        WHERE Id = :accId
                        LIMIT 1];
        return result;
    }

}