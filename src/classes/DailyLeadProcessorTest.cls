@isTest
public class DailyLeadProcessorTest {

    public static String CRON_EXP = '0 25 16 18 9 ? 2018';
    
    static testmethod void testScheduledJob() {
        Integer lt1=0;
        // Create some out of date Opportunity records
   		List<Lead> leadList=new List<Lead>();
        for (Integer i=0; i<200; i++) {
          leadList.add(new Lead(LastName='test'+i,
                                company='sfdc',
                               LeadSource=null));
        }
        insert leadList;
        
                
        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());         
        lt1 = [SELECT count() 
            FROM Lead 
            WHERE LeadSource=null];
        // Stopping the test will run the job synchronously
        Test.stopTest();
        
        // Now that the scheduled job has executed,
        // check that our tasks were created
        Integer lt = [SELECT count() 
            FROM Lead 
            WHERE LeadSource!=null];
        System.assertEquals(lt1,lt);
    }


}