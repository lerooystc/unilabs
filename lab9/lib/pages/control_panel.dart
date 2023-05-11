import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../classes/machine.dart';
import '../classes/coffee.dart';

class ControlPanel extends StatefulWidget {
  final Machine machine;
  const ControlPanel({Key? key, required this.machine}) : super(key: key);


  @override
  State<ControlPanel> createState() => _ControlPanel();
}

class _ControlPanel extends State<ControlPanel> {
  TextEditingController cbController = TextEditingController();
  TextEditingController waterController = TextEditingController();
  TextEditingController milkController = TextEditingController();
  TextEditingController cashController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView(
                children: [
                  ColoredBox(color: Colors.lime,
                      child: Column(children: [
                        const Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                            child: Text(
                                'Coffee Maker',
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
                                        children: [
                                          Text('Coffee Beans: ${widget.machine
                                              .resources.coffeeBeans}'),
                                          Text('Milk: ${widget.machine.resources
                                              .milk}'),
                                          Text(
                                              'Water: ${widget.machine.resources
                                                  .water}'),
                                          Text('Cash: ${widget.machine.resources
                                              .cash}'),
                                        ]
                                    )
                                )
                            )
                        ),
                        const Padding(padding: EdgeInsets.all(20.0))
                      ],)),
            Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [

              Padding(padding: const EdgeInsets.fromLTRB(30,0,30,0), child:
              TextField(
                controller: cbController,
                decoration: const InputDecoration(
                    hintText: 'Input coffee beans.'
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp("[0-9]")),
                ],
                onChanged: (value) {
                  setState(() {});
                },
              ),),

              Padding(padding: const EdgeInsets.fromLTRB(30,0,30,0), child:
              TextField(
                controller: waterController,
                decoration: const InputDecoration(
                    hintText: 'Input water.'
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp("[0-9]")),
                ],
                onChanged: (value) {
                  setState(() {});
                },
              ),),

              Padding(padding: const EdgeInsets.fromLTRB(30,0,30,0), child:
              TextField(
                controller: milkController,
                decoration: const InputDecoration(
                    hintText: 'Input milk.'
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp("[0-9]")),
                ],
                onChanged: (value) {
                  setState(() {});
                },
              ),),

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
              ),),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Padding(padding: const EdgeInsets.fromLTRB(10,20,10,20), child:
                ElevatedButton(
                    onPressed: cashController.text.isEmpty ? null : () =>
                        setState(() {
                          widget.machine.addResources(int.parse(cbController.text),
                              int.parse(waterController.text),
                              int.parse(milkController.text),
                              int.parse(cashController.text));
                        })
                    ,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Icon(Icons.add))),
                Padding(padding: const EdgeInsets.fromLTRB(10,20,10,20), child:
                ElevatedButton(
                    onPressed: cashController.text.isEmpty ? null : () =>
                        setState(() {
                          widget.machine.addResources(-int.parse(cbController.text),
                              -int.parse(waterController.text),
                              -int.parse(milkController.text),
                              -int.parse(cashController.text));
                        })
                    ,
                    child: const Icon(Icons.remove)))
              ],)
            ])
                ])));
  }
}