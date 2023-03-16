import 'package:flutter/material.dart';

class InfinityList extends StatefulWidget {
  const InfinityList({super.key});

  @override
  createState() => InfinityListState();
}

class InfinityListState extends State<InfinityList> {
  final List<String> _array = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Infinite List'),
        ),
        body: ListView.builder(
            itemBuilder: (context, i)
            {
              if (i.isOdd) return const Divider();
              final int index = i ~/ 2;
              if (index >= _array.length) {
                _array.addAll(
                  ['$index', '${index + 1}', '${index + 2}']
              );
              }
              return ListTile(title: Text('Строка №${_array[index]}'));
            }
            )
    );
  }
}