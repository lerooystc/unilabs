import 'package:flutter/material.dart';


class SimpleList extends StatelessWidget {
  const SimpleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Simple List'),
        ),
        body: ListView( // it just returns a list
          children: const [
            Text('0000'),
            Divider(),
            Text('0001'),
            Divider(),
            Text('0010')
          ],
        )
    );
  }
}