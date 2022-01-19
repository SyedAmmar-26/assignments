import 'dart:io';

void main() {
  print("Enter your favourite number:");
  int? n = int.parse(stdin.readLineSync()!);
  print("Your favourite number is $n");
}
