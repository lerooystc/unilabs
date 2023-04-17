import 'classes/machine.dart';
import 'classes/coffee.dart';

void main() {
  Coffee espresso = Coffee('Espresso',2,2,2,2);
  Machine machine = Machine(4,4,4,4);
  print(machine.makingCoffee(espresso));
  print(machine.makingCoffee(espresso));
  print(machine.makingCoffee(espresso));
}


