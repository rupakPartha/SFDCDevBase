trigger ClosedOpportunityTrigger on Opportunity (before insert,before update) {
    List<Task> listOpportunityTask=new List<Task>();
    for(Opportunity o : Trigger.new){
        if(o.StageName=='Closed Won'){
            Task tempTask=new Task(subject='Follow Up Test Task',whatId=o.Id);
            listOpportunityTask.add(tempTask);
        }
    }
    insert listOpportunityTask;
    
    
}