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
              if (i.isOdd) return const Divider(); // return a divider if it's an odd cycle
              final int index = i ~/ 2; // restoring the index to the actual value (not affected by divider generation)
              if (index >= _array.length) { // if needed the app generates more strings
                _array.addAll(
                  ['$index', '${index + 1}', '${index + 2}']
              );
              }
              return ListTile(title: Text('Строка №${_array[index]}')); // return the string if it's an even cycle
            }
            )
    );
  }
}