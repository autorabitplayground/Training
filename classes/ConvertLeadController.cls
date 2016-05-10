public class ConvertLeadController 
{
    public String opportunityName {get; set;}
    public String convertedStatus {get; set;}
    public Id leadOwner {get; private set;}
    
    public Contact accountLookup {get; set;}
    
    public ConvertLeadController(ApexPages.StandardController stdController)
    {
        accountLookup = new Contact();	
        convertedStatus = 'Closed - Converted';
    }

    public PageReference convertLead()
    {
		String leadId = ApexPages.currentPage().getParameters().get('id');
 		PageReference pref = null;		
        
        if(String.isNotBlank(leadId))
        {   
        	Lead leadDetail = [Select Id, FirstName, LastName, IsConverted, Status, Company from Lead where id=:leadId];
            
            Contact newContact = new Contact();
            newContact.FirstName = leadDetail.FirstName;
            newContact.LastName = leadDetail.LastName;
            newContact.AccountId = accountLookup.AccountId;
			
			insert newContact;            
            
            OpportunityStage oppStage = [SELECT Id,IsActive,IsClosed,IsWon,MasterLabel,SortOrder FROM OpportunityStage where SortOrder=1];
            
            Opportunity o =new Opportunity();
            o.Name = leadDetail.Company;
            o.AccountId = accountLookup.AccountId;
            o.StageName = oppStage.MasterLabel;
            o.CloseDate = System.now().date().addDays(30);
            
            insert o;
            
            LeadStatus convertStatus = [Select Id, MasterLabel from LeadStatus where isConverted=true];
            
            Database.LeadConvert leadConvert = new Database.LeadConvert();
            leadConvert.setLeadId(leadDetail.Id);
            leadConvert.setConvertedStatus(convertStatus.MasterLabel);
            
            Database.LeadConvertResult leadConvResult = Database.convertLead(leadConvert);
            
            Lead leadFromDB = [select 
                       FirstName,
                       LastName,
                       Company,
                       Country,
                       Status,
                       isConverted,
                       ConvertedAccountId,
                       ConvertedContactId
                       from Lead where id = : leadDetail.Id];
    
            System.debug('this lead looks like: ' + leadFromDB);
            
            if(leadConvResult.isSuccess())
            {
             	pref = new PageReference('/'+leadDetail.Id);
                pref.setRedirect(true);
            }
        }
        
        return pref;
    }
}