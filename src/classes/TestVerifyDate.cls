@isTest
public class TestVerifyDate {

    testmethod static void testCheckDates(){
        Date today=System.today();
        Date thresholdDate = Date.newInstance(today.year(), today.month(), today.addDays(30).day());
        Date thresholdDate_ext = Date.newInstance(today.year(), today.month(), today.addDays(29).day());
        
        Test.startTest();
       // VerifyDate.CheckDates(today, thresholdDate);
        VerifyDate.CheckDates(thresholdDate,today);
        VerifyDate.CheckDates(today, thresholdDate_ext);
        Test.stopTest();
    }
}