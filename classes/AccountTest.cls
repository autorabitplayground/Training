public class AccountTest{


	public static void insertaccount()
	{
	// A new comment on 25th Jan
	//Added for AutoCommit
	Account a = new account();
	a.name = 'test-autocommit22';
	insert a;
	// Added some information in Visa Use Case Demo
	
	}

	//Method to update an Account
	public void updateAccount()
	{
		//comment for demo purpose 5/9
		Account a = [Select id, Name from Account Limit 1];
		
		if(a != null)
		{
			a.Name = 'GitHub-AutoRabit Demo';
			update a;
		}
	}

	public void deleteAccount(Account a)
	{
		if(a != null){
			delete a;
		}

	}

	
}