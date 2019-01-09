public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer count,String lastName){
        
        String baseFirstName='Test';
        
        List<Contact> contactList=new List<Contact>();
        
        while(count-- >0){
            Contact con=new Contact(FirstName='Test'+count,
                                   LastName=lastName);
            contactList.add(con);
        }
        
        return contactList;
    }

}