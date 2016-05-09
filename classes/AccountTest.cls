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
		Account a = [Select id, Name from Account Limit 1];
		
		if(a != null)
		{
			a.Name = 'GitHub-AutoRabit Demo';
			update a;
		}
	}
	
	//Method to get 1000 Contacts
	public void getContacts()
	{
		List<Contact> contactList = [Select id, Name from Contact Limit 1000];
		
		for(Contact c : contactList)
		{
			System.debug('Name : ' + c.Name);		
		}
	}
}