@isTest
private class AccountManagerTest {
    testmethod static void testAccountManager(){
        ID recordId=createTestRecord();
        System.debug('recordId :'+recordId);
        //Test.setMock(HttpCalloutMock.class, new AccountManagerMock());
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://abvnlwec-dev-ed.my.salesforce.com/services/apexrest/Account/'
            + recordId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account testAccount=AccountManager.getAccount();
        System.assertEquals(true, null!=testAccount);
    }
    private static Id createTestRecord(){
        Account testAcc=new Account(Name='testAccount');
        insert testAcc;
        insert new Contact(FirstName='Test',
                          LastName='Contact1',
                          AccountId=testAcc.Id);
        insert new Contact(FirstName='Test',
                          LastName='Contact2',
                          AccountId=testAcc.Id);
        return testAcc.id;
    }
}