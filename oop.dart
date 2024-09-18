// Encapsulation: Class to represent a bank account
class BankAccount {
  // Private variables (Encapsulation)
  String _accountHolder;
  double _balance;

  // Constructor
  BankAccount(this._accountHolder, this._balance);

  // Getter for accountHolder
  String get accountHolder => _accountHolder;

  // Setter for balance
  set balance(double amount) {
    if (amount >= 0) {
      _balance = amount;
    } else {
      print("Balance cannot be negative.");
    }
  }

  // Getter for balance
  double get balance => _balance;

  // Method to deposit money
  void deposit(double amount) {
    _balance += amount;
    print("Deposited \$${amount}. New balance: \$$_balance");
  }

  // Polymorphism: Method to withdraw money, to be overridden by subclasses
  void withdraw(double amount) {
    if (amount <= _balance) {
      _balance -= amount;
      print("Withdrawn \$${amount}. Remaining balance: \$$_balance");
    } else {
      print("Insufficient funds.");
    }
  }
}

// Inheritance: Subclass SavingsAccount inherits from BankAccount
class SavingsAccount extends BankAccount {
  double _interestRate;

  // Constructor
  SavingsAccount(String accountHolder, double balance, this._interestRate)
      : super(accountHolder, balance);

  // Method to calculate interest
  void addInterest() {
    double interest = balance * _interestRate / 100;
    deposit(interest);
    print("Added interest: \$${interest}. New balance: \$${balance}");
  }

  // Polymorphism: Overriding withdraw method to allow limited withdrawals
  @override
  void withdraw(double amount) {
    if (amount <= balance) {
      super.withdraw(amount);  // Calling the superclass method
      print("Withdraw successful from savings account.");
    } else {
      print("Withdrawal denied due to insufficient funds.");
    }
  }
}

// Abstraction: Abstract class representing an employee
abstract class Employee {
  String name;
  int id;

  Employee(this.name, this.id);

  // Abstract method to calculate salary
  double calculateSalary();

  // Abstract method for job role description
  String jobRole();
}

// Subclass FullTimeEmployee that implements the abstract class
class FullTimeEmployee extends Employee {
  double monthlySalary;

  FullTimeEmployee(String name, int id, this.monthlySalary) : super(name, id);

  // Implementing abstract methods
  @override
  double calculateSalary() => monthlySalary;

  @override
  String jobRole() => "Full-time employee working 40 hours per week.";
}

// Subclass PartTimeEmployee that implements the abstract class
class PartTimeEmployee extends Employee {
  double hourlyRate;
  int hoursWorked;

  PartTimeEmployee(String name, int id, this.hourlyRate, this.hoursWorked)
      : super(name, id);

  // Implementing abstract methods
  @override
  double calculateSalary() => hourlyRate * hoursWorked;

  @override
  String jobRole() => "Part-time employee working $hoursWorked hours per week.";
}

void main() {
  // Encapsulation example
  var myAccount = BankAccount("John Doe", 1000.0);
  myAccount.deposit(500.0);
  myAccount.withdraw(300.0);

  // Inheritance and Polymorphism example
  var mySavings = SavingsAccount("Jane Doe", 1500.0, 5.0);
  mySavings.deposit(200.0);
  mySavings.addInterest();
  mySavings.withdraw(2000.0);

  // Abstraction example
  Employee fullTime = FullTimeEmployee("Alice", 101, 4000.0);
  Employee partTime = PartTimeEmployee("Bob", 102, 25.0, 20);

  print("\n${fullTime.name}'s salary: \$${fullTime.calculateSalary()}");
  print("${fullTime.jobRole()}");

  print("\n${partTime.name}'s salary: \$${partTime.calculateSalary()}");
  print("${partTime.jobRole()}");
}
