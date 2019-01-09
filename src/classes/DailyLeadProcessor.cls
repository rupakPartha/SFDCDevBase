global class DailyLeadProcessor implements Schedulable {
    
    global void execute(SchedulableContext ctx) {
        List<Lead> leadList = [SELECT Id, LeadSource 
                                    FROM Lead 
                                    WHERE LeadSource = NULL
                              LIMIT 200];
        updateLead(leadList);
        
    }
    
    private void updateLead(List<Lead> leads){
        for(Lead l : leads){
            l.LeadSource='Dreamforce';
        }
        update leads;
    }    
}