@isTest
public class TestRestrictContactByName {
    testmethod static void testRestrictContactByName(){
        Contact con=new Contact(LastName='INVALIDNAME');
        
        insert con;
    }
    

}