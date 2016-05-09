public class AccountTest{

public static void insertaccount()
{
//add new comment on may 9th.
//adding one more comment on may 9th -- 2
// A new comment on 25th Jan
//Added for AutoCommit
Account a = new account();
a.name = 'test-autocommit22';
insert a;
// Added some information in Visa Use Case Demo

}

public static void deleteaccount(Account a)
{
	//delete account
	if(a != null){
		delete a;
	}

}




}