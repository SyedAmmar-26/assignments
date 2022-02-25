import 'dart:io';

abstract class Product {
  int _stockQuantity = 0, _price = 0;
  String _name = "";
  Product(this._name, this._price, this._stockQuantity);
  String get name => _name;
  int get stockQuantity => _stockQuantity;
  int get price => _price;
  set setname(String name) {
    _name = name;
  }

  set setstockQuantity(int qty) {
    _stockQuantity = qty;
  }

  set setprice(int price) {
    _price = price;
  }
}

class TShirt extends Product {
  TShirt(String name, int price, int stockQuantity)
      : super(name, price, stockQuantity);
}

class USB extends Product {
  USB(String name, int price, int stockQuantity)
      : super(name, price, stockQuantity);
}

class Iphone extends Product {
  Iphone(String name, int price, int stockQuantity)
      : super(name, price, stockQuantity);
}

void main(List<String> args) {
  List<Product> product = [];
  product.add(TShirt("Polo T-Shirt", 1000, 6000));
  product.add(USB("Kingston USB", 1500, 5000));
  product.add(Iphone("Iphone13", 350000, 10000));
  Order(product);
}

class Order_Product {
  String name = "";
  int qty = 0, price = 0;
  Order_Product(this.name, this.qty, this.price);
}

void ProductLister(var list) {
  int i = 0;
  for (var product in list) {
    print("${++i}) ${product.name}");
  }
}

void Order(var product) {
  var flag = true;
  List<Order_Product> temp = [];

  int choice = 0;
  while (flag == true) {
    var chCorrect = false;
    while (chCorrect != true) {
      ProductLister(product);
      stdout.write("Enter your Choice = ");
      choice = int.parse(stdin.readLineSync()!);
      switch (choice) {
        case 1:
          clear();
          chCorrect = true;
          stdout.write("Enter Quantity of T-Shirts = ");
          int qty = int.parse(stdin.readLineSync()!);
          if (qty <= product[choice - 1].stockQuantity) {
            temp.add(Order_Product(
                product[choice - 1].name, qty, product[choice - 1].price));
            product[choice - 1] -= qty;
          } else {
            chCorrect = false;
            print("Your Entered Quantity is greater than our stock quantity");
          }
          break;
        case 2:
          clear();
          chCorrect = true;
          stdout.write("Enter Quantity of USB = ");
          int qty = int.parse(stdin.readLineSync()!);
          if (qty <= product[choice - 1]._stockQuantity) {
            temp.add(Order_Product(
                product[choice - 1].name, qty, product[choice - 1].price));
            product[choice - 1] -= qty;
          } else {
            chCorrect = false;
            print("Your Entered Quantity is greater than our stock quantity");
          }
          break;
        case 3:
          clear();
          chCorrect = true;
          stdout.write("Enter Quantity of Iphone = ");
          int qty = int.parse(stdin.readLineSync()!);
          if (qty <= product[choice - 1].stockQuantity) {
            temp.add(Order_Product(
                product[choice - 1].name, qty, product[choice - 1].price));
            product[choice - 1] -= qty;
          } else {
            chCorrect = false;
            print("Your Entered Quantity is greater than our stock quantity");
          }
          break;
        default:
          print("Invalid Input Detected!");
      }
    }
    bool t = true;
    while (t != false) {
      clear();
      print(
          "Do You further Want to add items to cart!\nY for Yes\nAnykey to Checkout\n\nEnter your Choice = ");
      String ch = stdin.readLineSync()!;
      if (ch.toLowerCase() == "y") {
        t = false;
      } else {
        flag = false;
      }
    }
    clear();
  }
  checkout(temp);
}

checkout(List<Order_Product> list) {
  int tot = 0;
  clear();
  print("=========Your Order=========");
  for (int i = 0; i < list.length; i++) {
    tot += (list[i].price * list[i].qty);
    print("${list[i].qty} X ${list[i].name} : total $tot rs");
  }
  print("============================");
  print("Your Total Bill = $tot rs");
  print("Thanks for purchasing!");
}

clear() {
  for (int i = 0; i < stdout.terminalLines; i++) {
    stdout.writeln();
  }
}
