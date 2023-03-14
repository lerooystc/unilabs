import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Бебра, Германия'),
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
  int _likeCounter = 0;
  String phoneNumba = '88005553535';

  void _incrementCounter() {
    setState(() {
      _likeCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Image.asset('assets/bebra.png'),
          Expanded(
            child:
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child:
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      Text(
                        'Бебра, Германия',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        'Население: 13,789',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent
                        ),
                        onPressed: _incrementCounter,
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                    ),
                      Text(
                      '$_likeCounter'
                    )]
                  )
                ],
              )
            )
          ),
          Expanded(
              child:
              Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent
                              ),
                              onPressed: () => launchUrl(
                                Uri.parse('https://dev-yakuza.posstree.com/en/'),
                              ),
                              child: const Icon(
                                Icons.phone,
                                color: Colors.green,
                              ),
                            ),
                            const Text(
                                'Позвонить'
                            )
                          ],
                        )
                      ],
                    )
              )
          )
        ]
      )
    );
  }
}