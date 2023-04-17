import 'package:lab9/classes/coffee.dart';

class Machine {
  int coffeeBeans = 0;
  int milk = 0;
  int water = 0;
  int cash = 0;

  Machine(this.coffeeBeans, this.milk, this.water, this.cash);

  bool isAvailableResource(Coffee coffee){
    if((coffeeBeans >= coffee.coffeeBeans) && (milk >= coffee.milk) && (water >= coffee.water) && (cash >= coffee.cash)) {
      return true;
    }
    return false;
  }

  void subtractResources(Coffee coffee){
    coffeeBeans = coffeeBeans - coffee.coffeeBeans;
    water = water - coffee.water;
    milk = milk - coffee.milk;
    cash = cash - coffee.cash;
  }

  String makingCoffee(Coffee coffee){
    if(isAvailableResource(coffee)) {
      subtractResources(coffee);
      return 'You got an ${coffee.name}';
    }
    return 'Not enough funds';
  }
}