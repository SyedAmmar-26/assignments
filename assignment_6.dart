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
  int choice;
  int count = 0;
  while (flag != 1) {
    print(Process.runSync("cls", [], runInShell: true).stdout);
    print("1) Add Contact");
    print("2) Update Contact");
    print("3) Delete Contact");
    print("4) List all Contacts");
    print("5) Exit");
    choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
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
      case 2:
        String n = "", p = "", e = "", d = "";
        print("\nContact Name = ");
        n = stdin.readLineSync()!;
        print("\nPhone Number = ");
        p = stdin.readLineSync()!;
        if (exist(persons, n, p) == true) {
          for (Contact pr in persons) {
            if (pr.name == n && pr.pno == p) {
              print("\nContact Name = ");
              pr.name = stdin.readLineSync()!;
              print("\nPhone Number = ");
              pr.pno = stdin.readLineSync()!;
              int f = 0;
              while (f != 1) {
                print(
                    "Do You Want to give email and date of birth?\nPress Y for yes and N for No");
                String ch = stdin.readLineSync()!;
                if (ch == 'Y' || ch == 'y') {
                  print("\nEmail Address = ");
                  pr.email = stdin.readLineSync()!;
                  print("\nDate of Birth = ");
                  pr.dob = stdin.readLineSync()!;
                  persons.add(Contact());
                  persons[count].addContact(n, p, email: e, dob: d);
                  f = 1;
                } else if (ch == 'N' || ch == 'n') {
                  pr.addContact(n, p);
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
      case 3:
        if (count != 0) {
          print(count);
          String n = "", p = "";
          print("\nContact Name = ");
          n = stdin.readLineSync()!;
          print("\nPhone Number = ");
          p = stdin.readLineSync()!;
          if (exist(persons, n, p) == true) {
            persons.removeWhere((item) => item.name == n && item.pno == p);
          }
        } else {
          print("No Contacts in List");
        }
        break;
      case 4:
        listFunc(persons);
        break;
      case 5:
        flag = 1;
        break;
    }
  }
}

void listFunc(dynamic list) {
  for (Contact c in list) {
    c.detail();
  }
}

bool exist(dynamic list, String name, String pno) {
  for (dynamic c in list) {
    if (c.contact == name && c.pno == pno) {
      return true;
    }
  }
  return false;
}
