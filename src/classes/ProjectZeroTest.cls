@isTest
public class ProjectZeroTest {
     @isTest static void testFibonacci() {
        //Single Action - Positive 
        System.assertEquals(1, ProjectZero.fibonacci(1));
        //System.assertEquals(1, ProjectZero.fibonacci(1)) 
     }
    
    
       @isTest static void Factorial() {
        // Single Action- Positive
        System.assertEquals( 1, ProjectZero.Factorial(0));
       }
    
    @isTest Static void testUpdateAccountsize() {
        // test Single Action - positive
        //List<Account> accList = new 
        insert new Account(Name='Test12345', NumberOfEmployees=1); 
        insert new Account(Name='Test12346', NumberOfEmployees=1001);
        insert new Account(Name='Test12347', NumberOfEmployees=11000); 
        ProjectZero.updateAccountSize();
        
        Account a1 = [SELECT Size__c FROM Account WHERE Name='Test12345' LIMIT 1];
        System.assertEquals('Small', a1.Size__c);
        Account a2 = [SELECT Size__c FROM Account WHERE Name='Test12346' LIMIT 1];
        System.assertEquals('Medium', a1.Size__c);
        Account a3 = [SELECT Size__c FROM Account WHERE Name='Test12347' LIMIT 1];
        System.assertEquals('Large', a1.Size__c);
        
        // Test Bulk Action - Position
        List<Account> accs = [SELECT NumberOfEmployees, Size__c FROM Account WHERE Name LIKE 'Test%'];
        for(Account a: accs) {
            if (a.NumberOfEmployees < 1000) {
                System.assertEquals('Small', a.Size__c);
                
            }
        }
    }
    
    @isTest Static void updateCALeads() {
        List<Lead> leads = new List<Lead>();
        leads.add(new Lead(LastName='Test1234', State='CA', Company= '123'));
        leads.add(new Lead(LastName='Test1235', State='CA', Company= '123'));
        leads.add(new Lead(LastName='Test1236', State='CA', Company= '123'));
        insert leads;
        
        ProjectZero.updateCALeads();
        
        List<Lead> ls = [Select Status, Description FROM Lead];
        for (Lead l:ls) {
         //   System.assertEquals('Closed - Not Converted', l);
        }
    }
}