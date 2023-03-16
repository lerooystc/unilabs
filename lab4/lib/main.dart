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
  // the url launcher decided to not parse any variables so I had to just hardcode it
  /*String phoneNumba = 'tel:+79788748169';*/
  /*String location = 'https://yandex.ru/maps/-/CCUOqPb7XC';*/

  void _incrementCounter() {
    setState(() {
      _likeCounter++;
    });
  }

  void _sharePressed() { // share function using share_plus
    Share.share('https://yandex.ru/maps/-/CCUOqPb7XC');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView( // listview so it scrolls
        children: [
          Image.asset('assets/bebra.png'), // image of bebra
          Expanded(
            child:
            Padding( // padding so it looks better
              padding: const EdgeInsets.only(top: 10.0),
              child:
              Row( // row with basic info
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
                  Row( // the like button and a counter for it
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
          Expanded( // three buttons with some functionality
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
                                Uri.parse('tel:+79788722222'), // launches the dial app 
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
                                Uri.parse('https://yandex.ru/maps/-/CCUOqPb7XC'), // launches the link which might be attached to an app able to parse it
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
          const Expanded( // the long text to show scrolling possibilities 
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