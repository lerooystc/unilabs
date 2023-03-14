import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

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
      home: const MyHomePage(title: 'Города Германии'),
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
  /*String phoneNumba = 'tel:+79788748169';*/
  /*String location = 'https://yandex.ru/maps/-/CCUOqPb7XC';*/

  void _incrementCounter() {
    setState(() {
      _likeCounter++;
    });
  }

  void _sharePressed() {
    Share.share('https://yandex.ru/maps/-/CCUOqPb7XC');
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
                      IconButton(
                        onPressed: _incrementCounter,
                        color: Colors.red,
                        icon: const Icon(
                          Icons.favorite,
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
                            IconButton(
                              icon: const Icon(Icons.phone),
                              onPressed: () => launchUrl(
                                Uri.parse('tel:+79788722222'),
                              ),
                              color: Colors.green,
                              ),
                            const Text(
                                'Позвонить',
                                style: TextStyle(color:Colors.green)
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.navigation),
                              onPressed: () => launchUrl(
                                Uri.parse('https://yandex.ru/maps/-/CCUOqPb7XC'),
                              ),
                              color: Colors.green,
                            ),
                            const Text(
                                'Маршрут',
                                style: TextStyle(color:Colors.green)
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.share),
                              onPressed: _sharePressed,
                              color: Colors.green,
                            ),
                            const Text(
                                'Поделиться',
                                style: TextStyle(color:Colors.green)
                            )
                          ],
                        )
                      ],
                    )
              )
          ),
          const Expanded(
              child:
              Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text('Название Бебра произошло от Биберахо ("деревня на'
                      ' реке Бобр"; Бибер и сегодня означает "бобр" на немецком '
                      'языке). Позже оно превратилось сначала в Bibera, а затем '
                      'в сегодняшнее название Бебра. В 786 году город впервые '
                      'документально упоминается в каталоге владений аббатства '
                      'Херсфельд, которое было построено в 769 году. Причиной '
                      'упоминания было то, что Бебра была пожертвована аббатству'
                      ' для покрытия потребностей в продовольствии, что '
                      'позволяет сделать вывод, что сам справочник, а значит и '
                      'существование Бебры, относится к более раннему периоду.')
              )
          )
        ]
      )
    );
  }
}