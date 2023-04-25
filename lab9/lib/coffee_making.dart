import 'dart:developer';

Future<void> boilWater() async {
  log('start_process: boilWater');
  await Future.delayed(const Duration(seconds: 3), () => log('end_process: boilWater'));
}

Future<void> brewCoffee() async {
  log('start_process: brewCoffee');
  await Future.delayed(const Duration(seconds: 5), () => log('end_process: brewCoffee'));
}

Future<void> whipMilk() async {
  log('start_process: whipMilk');
  await Future.delayed(const Duration(seconds: 5), () => log('end_process: whipMilk'));
}

Future<void> mixMilk() async {
  log('start_process: mixMilk');
  await Future.delayed(const Duration(seconds: 3), () => log('end_process: mixMilk'));
}