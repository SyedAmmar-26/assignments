import 'dart:io';

void main() {
  var uname = "Ahmed";
  String pwd = "12asd";
  print(Process.runSync("cls", [], runInShell: true).stdout);
  print("\t\tWelcome to ATM Machine");
  print("\n\nEnter Username = ");
  var user = stdin.readLineSync()!;
  print("\nEnter Password = ");
  String pass = stdin.readLineSync()!;
  if (uname == user) {
    if (pwd.compareTo(pass) == 0) {
      func(user);
    } else {
      print("\nWrong Password Entered!");
    }
  } else {
    print("\nWrong User Name Entered!");
  }
}

void func(var user) {
  int choice, i, flag = 0;
  Map<String, String> balance = {"Smith": "104000", "Ahmed": "60000"};
  while (flag != 1) {
    print(Process.runSync("cls", [], runInShell: true).stdout);
    print("\t\tWelcome $user\n");
    print("\n1) Check Balance");
    print("\n2) Deposit Money");
    print("\n3) Cash Withdrawl");
    print("\n4) Quit");
    print("\n\nEnter Your Choice = ");
    choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        print(Process.runSync("cls", [], runInShell: true).stdout);
        print(Process.runSync("cls", [], runInShell: true).stdout);
        print(Process.runSync("cls", [], runInShell: true).stdout);
        for (i = 0; i < balance.length; i++) {
          if (balance[user] != null) {
            print(user + ", your balance is = " + balance[user]);
            break;
          }
        }
        if (i == balance.length) print("Balance not found!");
        stdin.readLineSync();
        break;
      case 2:
        print(Process.runSync("cls", [], runInShell: true).stdout);
        print("Enter Amount You Want to Deposit = ");
        int amount = int.parse(stdin.readLineSync()!);
        for (i = 0; i < balance.length; i++) {
          if (balance[user] != null) {
            print(user + ", your previous balance is = " + balance[user]);
            int temp = int.parse(balance[user]!) + amount;
            balance[user] = temp.toString();
            break;
          }
        }
        print(user + ", your new balance is = " + balance[user]);
        stdin.readLineSync();
        break;
      case 3:
        print(Process.runSync("cls", [], runInShell: true).stdout);
        print("Enter Amount You Want to Withdraw = ");
        int amount = int.parse(stdin.readLineSync()!);
        for (i = 0; i < balance.length; i++) {
          if (balance[user] != null) {
            print(user + ", your previous balance is = " + balance[user]);
            int temp = int.parse(balance[user]!);
            if (temp > amount) {
              temp = temp - amount;
              balance[user] = temp.toString();
            }
            break;
          }
        }
        print(user + ", your new balance is = " + balance[user]);
        stdin.readLineSync();
        break;
      case 04:
        flag = 1;
        break;
      default:
        print("Invalid Input Detected!");
    }
  }
  print("\nHave a Nice Day!");
}
