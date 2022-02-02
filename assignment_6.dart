import 'dart:io';

class Contact {
  String name = "", pno = "", email = "", dob = "";
  addContact(String name, String pno, {String email = "", String dob = ""}) {
    this.name = name;
    this.pno = pno;
    this.email = email;
    this.dob = dob;
  }

  void detail() {
    print("\nContact Name = " + name);
    print("\nPhone Number = " + pno);
    print("\nEmail Address = " + email);
    print("\nDate of Birth = " + dob);
  }
}

void main() {
  List<Contact> persons = [];
  menu(persons);
}

void menu(dynamic persons) {
  int flag = 0;
  String choice;
  int count = 0;
  while (flag != 1) {
    print(Process.runSync("cls", [], runInShell: true).stdout);
    print("1) Add Contact");
    print("2) Update Contact");
    print("3) Delete Contact");
    print("4) List all Contacts");
    print("5) Exit");
    choice = stdin.readLineSync()!;
    switch (choice) {
      case '1':
        String n = "", p = "", e = "", d = "";
        print("\nContact Name = ");
        n = stdin.readLineSync()!;
        print("\nPhone Number = ");
        p = stdin.readLineSync()!;
        int f = 0;
        while (f != 1) {
          print(
              "Do You Want to give email and date of birth?\nPress Y for yes and N for No");
          String ch = stdin.readLineSync()!;
          if (ch == 'Y' || ch == 'y') {
            print("\nEmail Address = ");
            e = stdin.readLineSync()!;
            print("\nDate of Birth = ");
            d = stdin.readLineSync()!;
            persons.add(Contact());
            persons[count].addContact(n, p, email: e, dob: d);
            f = 1;
          } else if (ch == 'N' || ch == 'n') {
            persons.add(Contact());
            persons[count].addContact(n, p);
            f = 1;
          } else {
            print("\nWrong Input\nEnter to Continue");
            stdin.readLineSync();
            continue;
          }
          count++;
        }
        break;
      case '2':
        String n = "", p = "", e = "", d = "";
        print("\nEnter Contact Name = ");
        n = stdin.readLineSync()!;
        print("\nEnter Phone Number = ");
        p = stdin.readLineSync()!;
        if (exist(persons, n, p) == true) {
          for (Contact pr in persons) {
            if (pr.name.toLowerCase() == n.toLowerCase() && pr.pno == p) {
              print("\nEnter New Contact Name = ");
              n = stdin.readLineSync()!;
              print("\nEnter New Phone Number = ");
              p = stdin.readLineSync()!;
              int f = 0;
              while (f != 1) {
                print(
                    "Do You Want to give email and date of birth?\nPress Y for yes and N for No");
                String ch = stdin.readLineSync()!;
                if (ch == 'Y' || ch == 'y') {
                  print("\nEnter New Email Address = ");
                  e = stdin.readLineSync()!;
                  print("\nEnter New Date of Birth = ");
                  d = stdin.readLineSync()!;
                  pr.addContact(n, p, email: e, dob: d);
                  f = 1;
                } else if (ch == 'N' || ch == 'n') {
                  pr.addContact(n, p, email: pr.email, dob: pr.dob);
                  f = 1;
                } else {
                  print("\nWrong Input\nEnter to Continue");
                  stdin.readLineSync();
                  continue;
                }
              }
            }
          }
        }
        break;
      case '3':
        if (count != 0) {
          print(count);
          String n = "", p = "";
          print("\nContact Name = ");
          n = stdin.readLineSync()!;
          print("\nPhone Number = ");
          p = stdin.readLineSync()!;
          if (exist(persons, n, p) == true) {
            persons.removeWhere((item) =>
                item.name.toLowerCase() == n.toLowerCase() && item.pno == p);
            count--;
          }
        } else {
          print("No Contacts in List");
        }
        break;
      case '4':
        listFunc(persons);
        break;
      case '5':
        flag = 1;
        break;
      default:
        print("Invalid Input Detected!\nEnter To Continue");
        stdin.readLineSync();
    }
  }
}

void listFunc(dynamic list) {
  for (Contact c in list) {
    c.detail();
  }
}

bool exist(dynamic list, String name, String pno) {
  for (Contact c in list) {
    if (c.name.toLowerCase() == name.toLowerCase() && c.pno == pno) {
      return true;
    }
  }
  return false;
}
