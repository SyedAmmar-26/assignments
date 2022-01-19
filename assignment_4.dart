import 'dart:io';

void main() {
  print("Guess the name of your favourite item = ");
  String item = stdin.readLineSync()!;
  if (itemExist(item) == true) {
    print(item + " found in the list");
  } else {
    print(item + " not found in the list");
  }
}

bool itemExist(String item) {
  List<String> favItem = [
    "MSI Sword",
    "Hyperx headphones",
    "Mechanical Keyboard"
  ];
  for (String i in favItem) {
    if (i.toLowerCase() != item.toLowerCase()) {
      continue;
    } else {
      return true;
    }
  }
  return false;
}
