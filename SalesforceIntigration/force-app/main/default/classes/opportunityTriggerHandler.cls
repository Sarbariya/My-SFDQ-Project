public with sharing class opportunityTriggerHandler{
    public void onAfterInsert(list<Account> lstNew){
        //logic on after insert
        system.debug('###lstNew'+lstNew);
        
        list<opportunity> lstAccount = new list<opportunity>();
        for(Account acc : lstNew){
            opportunity opp = new opportunity();
            opp.AccountId = acc.ID;
            opp.Name = 'from ' +acc.Name+'Account';
            opp.stageName = 'Prospect';
            opp.closeDate = system.today();
            lstAccount.add(opp);
        }
        insert lstAccount;
        system.debug('###lstAccount'+lstAccount);
        //update lstAccount;
    }
    public void onAfterUpdate(list<Account> lstNew, list<Account> lstold){
        //logic on after update
        system.debug('###lstNew'+lstNew);
        system.debug('###lstold'+lstold);
        
        list<Account> lstAccount = new list<Account>();
        
        for(integer i=0; i<lstNew.size(); i++){
            if(lstNew[i].Name != lstold[i].Name){
                Account objAccount = new Account(Id=lstNew[i].Id, name = 'shubham'+lstNew[i]);
                lstAccount.add(objAccount);
            }
            if(lstNew[i].Name != lstold[i].Name){
                Account objAccount = new Account(Id=lstNew[i].Id);
        system.debug('###lstAccount'+lstAccount);
        if(!lstAccount.isEmpty()){
            update lstAccount;
        }
    }
}
    }
}