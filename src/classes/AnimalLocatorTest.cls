@isTest
public class AnimalLocatorTest {
    @isTest static void testPostCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        String actualValue = AnimalLocator.getAnimalNameById(0);
        String expectedValue = '{"animal":{"id":2,"name":"bear","eats":"berries, campers, adam seligman","says":"yum yum"}}';
        System.assertEquals(actualValue, expectedValue);
    }
}