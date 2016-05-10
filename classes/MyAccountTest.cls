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
	
	//Method to update Accounts
	public void updateAccountDetail()
	{
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