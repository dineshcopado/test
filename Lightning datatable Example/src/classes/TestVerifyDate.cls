@isTest
private class TestVerifyDate
{
static testMethod void testName() {


 Datetime current = System.now(); // returns date time value in GMT time zone.
     Date currDate = current.date();

     Time currTime = current.time();
     Datetime local = datetime.newinstance(currDate,currTime);

VerifyDate.CheckDates(currDate,currDate);


VerifyDate.CheckDates(currDate.addDays(10),currDate);

VerifyDate.DateWithin30Days(currDate,currDate);

VerifyDate.SetEndOfMonthDate(currDate);
}
}