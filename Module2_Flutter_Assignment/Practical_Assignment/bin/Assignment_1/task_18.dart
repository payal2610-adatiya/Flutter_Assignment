import 'dart:io';

class BankAccount {
  double balance = 0;

  void deposit(double amount) {
    balance += amount;
    print('Deposited: $amount');
  }

  void withdraw(double amount) {
    if (amount > balance) {
      print('Not enough money!');
    } else {
      balance -= amount;
      print('Withdrew: $amount');
    }
  }

  void checkBalance() {
    print('Current balance: $balance');
  }
}

void main() {
  var account = BankAccount();

  while (true) {
    print('\nWhat do you want to do?');
    print('1. Deposit');
    print('2. Withdraw');
    print('3. Check balance');
    print('4. Exit');
    print('Enter choice (1-4):');

    var choice = stdin.readLineSync();

    if (choice == '1') {
      print('Enter amount to deposit:');
      var amount = double.tryParse(stdin.readLineSync().toString() );
      account.deposit(amount ?? 0);
    }
    else if (choice == '2') {
      print('Enter amount to withdraw:');
      var amount = double.tryParse(stdin.readLineSync().toString() );
      account.withdraw(amount ?? 0);
    }
    else if (choice == '3') {
      account.checkBalance();
    }
    else if (choice == '4') {
      print('Goodbye!');
      break;
    }
    else {
      print('Invalid choice!');
    }
  }
}