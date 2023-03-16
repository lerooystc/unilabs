import 'package:flutter/material.dart';
import 'lists/SimpleList.dart';
import 'lists/InfinityList.dart';
import 'lists/InfinityMathList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.blueGrey[50],
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[700],
                foregroundColor: Colors.white,
                minimumSize: const Size(200, 50)
            )
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 24, color:Colors.black),
          titleMedium: TextStyle(fontSize: 24, color:Colors.black),
          labelLarge: TextStyle(fontSize: 20),
        )
      ),
      home: const MyHomePage(title: 'Списки элементов'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style:const TextStyle(fontSize: 20)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SimpleList()
                ),
              ),
              child: const Text('Simple List'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const InfinityList()
                ),
              ),
              child: const Text('Infinite List'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const InfinityMathList()
                ),
              ),
              child: const Text('Infinite Math List'),
            ),
          ],
        )
      )
    );
  }
}
