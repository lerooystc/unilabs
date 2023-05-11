import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../classes/machine.dart';
import '../classes/coffee.dart';

class DisplayScreen extends StatefulWidget {
  final Machine machine;
  final Espresso espresso = Espresso();
  final Latte latte = Latte();
  final Americano americano = Americano();
  final Cappuccino cappuccino = Cappuccino();
  DisplayScreen({Key? key, required this.machine}) : super(key: key);


  @override
  State<DisplayScreen> createState() => _DisplayScreen();
}

class _DisplayScreen extends State<DisplayScreen> {
  var _coffee;
  String _progress = 'Coffee Maker';
  bool _brewing = false;
  TextEditingController cashController = TextEditingController();

  void _brewCoffee() async {
    _setBrewing(true);
    _hints();
    _progress = await widget.machine.makeCoffee(_coffee);
    _setBrewing(false);
}

  void _hints() async {
    _progress = 'Boiling the water';
    setState(() {
    });
    await Future.delayed(const Duration(seconds:3), () => _progress = 'Brewing the coffee');
    setState(() {
    });
    if (_coffee.milk() > 0) {
      await Future.delayed(
          const Duration(seconds: 5), () => _progress = 'Mixing the milk');
      setState(() {});
    }
  }

  void _setBrewing(bool brewing) {
    setState(() {
      _brewing = brewing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView(
              children: [
                ColoredBox(color: Colors.lime, child: Column(children: [ Padding(padding: EdgeInsets.fromLTRB(0,20,0,20), child: Text(
                  _progress,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36),
                  textAlign: TextAlign.center)),
                  Align(
                      alignment: Alignment.center,
                      child: ColoredBox(
                          color: Colors.lime.shade100,
                          child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                  children:[
                                    Text('Coffee Beans: ${widget.machine.resources.coffeeBeans}'),
                                    Text('Milk: ${widget.machine.resources.milk}'),
                                    Text('Water: ${widget.machine.resources.water}'),
                                    Text('Cash: ${widget.machine.resources.cash}'),
                                  ]
                              )
                          )
                      )
                  ),
                  const Padding(padding: EdgeInsets.all(20.0))
                ],)),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                  Flexible(child:
                Column(children: <Widget>[
                            ListTile(
                              title: const Text('Espresso: ₽100'),
                              leading: Radio(
                                value: widget.espresso,
                                groupValue: _coffee,
                                onChanged: (value) {
                                  setState(() {
                                    _coffee = value;
                                  });
                                },
                              ),
                            ),
                  ListTile(
                    title: const Text('Cappuccino: ₽120'),
                    leading: Radio(
                      value: widget.cappuccino,
                      groupValue: _coffee,
                      onChanged: (value) {
                        setState(() {
                          _coffee = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Latte: ₽150'),
                    leading: Radio(
                      value: widget.latte,
                      groupValue: _coffee,
                      onChanged: (value) {
                        setState(() {
                          _coffee = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Americano: ₽80'),
                    leading: Radio(
                      value: widget.americano,
                      groupValue: _coffee,
                      onChanged: (value) {
                        setState(() {
                          _coffee = value;
                        });
                      },
                    ),
                  ),
                            ])),
                            Align(child:
                              Padding(padding: const EdgeInsets.all(20.0), child:
                          ElevatedButton(
                              onPressed: (_brewing || _coffee == null) ? null : _brewCoffee,
                              child: Text(_brewing ? "Brewing" : "Make Coffee")
                          ))
                      )
                  ]
                ),
                Row(children: [
                  Expanded(child:
                      Padding(padding: const EdgeInsets.fromLTRB(30,0,30,0), child:
                  TextField(
                    controller: cashController,
                    decoration: const InputDecoration(
                      hintText: 'Input cash.'
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp("[0-9]")),
                    ],
                    onChanged: (value) {
                      setState(() {});
                    },
                  ))
                  ),
                  Padding(padding: const EdgeInsets.fromLTRB(10,0,10,0), child:
                  ElevatedButton(
                      onPressed: cashController.text.isEmpty ? null : () =>
                          setState(() {
                            widget.machine.addResources(0, 0, 0, int.parse(cashController.text));
                          })
                        ,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      child: const Icon(Icons.add))),
                  Padding(padding: const EdgeInsets.fromLTRB(10,0,10,0), child:
                  ElevatedButton(
                      onPressed: cashController.text.isEmpty ? null : () =>
                          setState(() {
                            widget.machine.addResources(0, 0, 0, -int.parse(cashController.text));
                          })
                      ,
                      child: const Icon(Icons.remove)))
                ],)
              ]
                )
          )
    );
  }
}