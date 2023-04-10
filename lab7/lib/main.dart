import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: const Text('Главное окно')
        ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            _getPushedText(context); // call the page 2 opener
          },
          child: const Text('Приступить к выбору...'),
        ),
      ),
    );
  }

  void _getPushedText(BuildContext context) async {
    // method to open the second page and snackbar the result
    final result = await Navigator.pushNamed(
        context, '/second');
    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result.toString()),
            duration: const Duration(seconds: 2),));
    }
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Второе окно')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context, 'Да!'); // pops with a true result
                },
              child: const Text('Да.'),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context, 'Нет!'); // pops with a false result
              },
              child: const Text('Нет.'),
            ),
          ],
        ),
      ),
    );
  }
}




void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (BuildContext context) => const MainScreen(), // route to main
      '/second' : (BuildContext context) => const SecondScreen(), // route 2
    },
  ));
}
