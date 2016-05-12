public class MyAccountTest{

	public static void insertaccount()
	{
		// A new comment on 25th Jan
		//Added for AutoCommit
		//added new comment on 5/10 - demo
		Account a = new account();
		a.name = 'test-autocommit22';
		insert a;
		
		// Added some information in Visa Use Case Demo
	}

	    //Method to delete Accounts
    public void deleteAccountDetail()
    {
        Account a = [Select id, Name from Account Limit 1];
        
        if(a != null)
        {
            
            
            delete a;
        }
    }
	
	//Method to update Accounts
	public void updateAccountDetail()
	{
		//added one more comment for demo 5/10 -  demo 2
		//added one more comment for demo 5/11 -  demo 3
		//added one more comment for demo 5/11 -  demo 4
		//added one more comment for demo 5/11 -  demo 5

		//added one more comment for demo 5/11 -  demo 6
		//added one more comment for demo 5/11 -  demo 7
		//added one more comment for demo 5/11 -  demo 8

//added one more comment for demo 5/11 -  demo 9		

		Account a = [Select id, Name from Account Limit 1];
		
		if(a != null)
		{
			a.Name = 'GitHub-AutoRabitDemo';
			
			update a;
		}
	}
	
	//Method to display Accounts...
	public void displayAccount()
	{
		System.debug('Method to display Account');
	}
}