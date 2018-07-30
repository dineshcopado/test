@IsTest
private class DailyLeadProcessorTest{



    static testmethod void testScheduledJob() {
    
    List<Lead> leadList = new List<Lead>();

for(Integer i =0; i<200;i++)leadList.add(new Lead(Company='test'+i, status = 'Working - Contacted', lastName ='test'));

insert leadList ;
    
    
     String CRON_EXP = '0 0 0 15 3 ? 2022';
     
      Test.startTest();
     String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());  
     Test.stopTest();
    }


}