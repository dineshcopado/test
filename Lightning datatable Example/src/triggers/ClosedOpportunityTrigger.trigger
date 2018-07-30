trigger ClosedOpportunityTrigger on Opportunity(after insert, after update) {

List<Task> taskList = new List<Task>();

for(Opportunity opp : trigger.new)
{
if(opp.stageName.equalsIgnoreCase('Closed Won'))
taskList.add(new Task(subject='Follow Up Test Task',WhatId =opp.Id));
}

insert taskList;

}