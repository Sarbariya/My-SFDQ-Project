public class DataBaseError {
    public static void main(){
        List<account> ac = New List<Account>();
        for(integer i=1; i<20; i++){
           ac.add(new Account(Name = 'i am ' + i , Numbers__c = 'Number of Employees => ' + i+10 ));
        }
        ac.add(new Account());
        system.debug('Total Account ' + ac.size());
    Database.saveResult[] save = database.insert(ac, false);
    for(Database.SaveResult s :save)
    {
        if(s.isSuccess()){
            system.debug('I am Successfully inserted And my id is => ' + s.getId());
        }
        else {
            system.debug('I was unsuccessfull due to some reason thats it for me now');
     		for(Database.Error err : s.getErrors())
            {
                system.debug(err.getstatuscode() + '  ' + err.getmessage() + ' ' + err.getFields());
            }
        }
    }
    }
}