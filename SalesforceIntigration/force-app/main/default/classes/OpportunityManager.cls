@RestResource(urlMapping='/Opportunities/*')
global with sharing class OpportunityManager {
    
@HttpPost
global static ID createOpportunity(String name, String stage, String closedate, String source) {
Opportunity newOpportunity = new Opportunity(name = name,
stageName = stage,
LeadSource = source,
closedate = Date.valueOf(closedate));

insert newOpportunity;
return newOpportunity.Id;
}
  @HttpGet
    global static List<Opportunity> getOpportunityById(){
        RestRequest request = RestContext.request;
        //grab id 
     // String oppId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        List<Opportunity> result = [select id,name ,Closedate,LeadSource from Opportunity];
        return result;
    }
    @HttpPut
    global static ID upsertOpportunity(String name, String stage, String closedate, String source) {
Opportunity thisOpportunity = new Opportunity(name = name,
stageName = stage,
LeadSource = source,
closedate = Date.valueOf(closedate));

Upsert thisOpportunity;
return thisOpportunity.Id;
    }
    @HttpDelete
    global static Opportunity UserDelete(){
        RestRequest request = RestContext.request;
        String oppId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
    	Opportunity dataDel = [select id,name from opportunity where LeadSource = :oppId limit 1];
        delete dataDel;
        return dataDel.id;
    }
}