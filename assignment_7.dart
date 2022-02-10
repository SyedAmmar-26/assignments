class Vehicle {
  void doService() {
    print("Vehicle is servicing....");
  }
}

class Car extends Vehicle {
  @override
  void doService() {
    print("Car is servicing....");
  }
}

class Bike extends Vehicle {
  @override
  void doService() {
    print("Bike is servicing....");
  }
}

class Bus extends Vehicle {
  @override
  void doService() {
    print("Bus is servicing....");
  }
}

class Truck extends Vehicle {
  @override
  void doService() {
    print("Truck is servicing....");
  }
}

void main() {
  Car c = Car();
  Bus b = Bus();
  Truck t = Truck();
  serviceCenter(c);
  serviceCenter(b);
  serviceCenter(t);
}

void serviceCenter(Vehicle v) {
  v.doService();
}
