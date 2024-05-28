public inherited sharing class InheritedSharing {
	public static void performDML() {
        Account a = [Select Id from Account where Name = 'System Admin Created' LIMIT 1];
        update a;
    }
}