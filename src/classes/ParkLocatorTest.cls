@isTest
private class ParkLocatorTest {
    testmethod static void testParkService(){
        Test.setMock(WebServiceMock.class,new ParkServiceMock());
        String[] response=ParkLocator.country('test');
        System.assertEquals(true, response!=null);
    }

}