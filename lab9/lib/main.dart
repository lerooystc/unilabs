import 'classes/machine.dart';
import 'classes/resources.dart';
import 'package:flutter/material.dart';
import 'pages/display.dart';
import 'pages/control_panel.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 18)
        )
      ),
      home: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => MyStatefulWidgetState();
}

class MyStatefulWidgetState extends State<MyStatefulWidget> {
  Resources resources = Resources(1000,1000,1000,1000);
  late Machine machine = Machine(resources);
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
      DisplayScreen(machine: machine),
      ControlPanel(machine: machine),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Machine'),
      ),
      // body: Center(
      //   child: widgetOptions.elementAt(_selectedIndex),
      // )
      body: IndexedStack(
        index: _selectedIndex,
        children: widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee_maker),
            label: 'Display',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pest_control_sharp),
            label: 'Control Panel',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
