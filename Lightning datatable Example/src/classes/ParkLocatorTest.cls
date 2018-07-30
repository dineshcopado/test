@IsTest
private class ParkLocatorTest 
{

  @isTest static void testPostCallout() {
  
  Test.setMock(WebServiceMock.class, new ParkServiceMock());
  
  ParkLocator.country('India');
  
  //ParkService.ParksImplPort park = new ParkService.ParksImplPort();

  //park.byCountry('Germany');
  
  
  }

}