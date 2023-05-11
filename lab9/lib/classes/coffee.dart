import 'i_coffee.dart';

class Espresso implements ICoffee {
  @override
  String name() => "Espresso";
  @override
  int coffeeBeans() => 100;
  @override
  int milk() => 0;
  @override
  int water() => 100;
  @override
  int cash() => 100;
}

class Latte implements ICoffee {
  @override
  String name() => "Latte";
  @override
  int coffeeBeans() => 100;
  @override
  int milk() => 50;
  @override
  int water() => 50;
  @override
  int cash() => 150;
}

class Cappuccino implements ICoffee {
  @override
  String name() => "Cappuccino";
  @override
  int coffeeBeans() => 100;
  @override
  int milk() => 30;
  @override
  int water() => 70;
  @override
  int cash() => 120;
}

class Americano implements ICoffee {
  @override
  String name() => "Americano";
  @override
  int coffeeBeans() => 50;
  @override
  int milk() => 0;
  @override
  int water() => 150;
  @override
  int cash() => 80;
}