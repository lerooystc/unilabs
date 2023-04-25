import 'i_coffee.dart';
import '../coffee_making.dart';
import 'resources.dart';

class Machine {
  Resources resources;

  Machine(this.resources);

  bool isAvailableResource(ICoffee iCoffee) {
    if ( (resources.coffeeBeans >= iCoffee.coffeeBeans()) && (resources.milk >= iCoffee.milk())
        && (resources.water >= iCoffee.water()) && (resources.cash >= iCoffee.cash()) ) {
      return true;
    }
    else {
      return false;
    }
  }

  void addResources(int cb, int m, int w, int c) {
    resources.coffeeBeans += cb;
    resources.milk += m;
    resources.water += w;
    resources.cash += c;
  }

  void subtractResources(ICoffee iCoffee){
    resources.coffeeBeans -= iCoffee.coffeeBeans();
    resources.milk -= iCoffee.milk();
    resources.water -= iCoffee.water();
    resources.cash -= iCoffee.cash();
  }

  Future<String> makeCoffee(ICoffee iCoffee) async {
    if (isAvailableResource(iCoffee)) {
      await boilWater();
      if (iCoffee.milk() > 0) {
        await Future.wait([brewCoffee(), whipMilk()]);
        await mixMilk();
      }
      else {
        await brewCoffee();
      }
      subtractResources(iCoffee);
      String name = iCoffee.name();
      return 'You got: $name!';
    }
    return 'Not enough funds.';
  }
}
