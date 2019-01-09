@isTest
public class AccountProcessorTest {
    
    testmethod static void testcountContacts(){
        List<Id> idList=new List<Id>();
        loadContacts();
        for(Account element :[select ID from Account]){
           idList.add(element.ID); 
        }
        
        Test.startTest();
        AccountProcessor.countContacts(idList);
        Test.stopTest();
    }
    @testsetup
    static void loadContacts(){
        integer count=10,recount=10;
        List<Account> listAccountAdd=new List<Account>();
        List<Contact> listContactAdd=new List<Contact>();
        while(count-- >0){
           listAccountAdd.add(new Account(Name='test'+count));
          
        }
        insert listAccountAdd;
        
        while(recount-- >0){
           
           listContactAdd.add(new Contact(firstName='test'+'_f_'+recount,
                                         lastName='test'+'_l_'+recount
                                         ));
        }
        insert listContactAdd;
        for(integer i=0;i<listContactAdd.size();i++){
            listContactAdd[i].accountId=listAccountAdd[i].Id;
        }
        
        update listContactAdd;
    }

}