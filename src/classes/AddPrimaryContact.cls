public class AddPrimaryContact implements Queueable {
    private Contact contact;
    private String state;
    
    public AddPrimaryContact(Contact con,String st){
        contact=con;
        state=st;
    }

    
    public void execute(QueueableContext context) {
        List<Account> accountList=[SELECT Id,BillingState from Account where BillingState=:state];
        List<Contact> contactList=new List<Contact>();
        integer count=0;
        for(Account ac : accountList){
            Contact con=new Contact(LastName='Test'+count,
            						accountId=ac.Id);
            contactList.add(con);
        }
        insert contactList;
    }
    

}