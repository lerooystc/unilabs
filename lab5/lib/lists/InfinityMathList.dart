import 'package:flutter/material.dart';
import 'dart:math';

class InfinityMathList extends StatefulWidget {
  const InfinityMathList({super.key});

  @override
  createState() => InfinityMathListState();
}

class InfinityMathListState extends State<InfinityMathList> {
  final List<String> _array = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Infinite Math List'),
        ),
        body: ListView.builder(
            itemBuilder: (context, i)
            {
              if (i.isOdd) return const Divider();
              final int index = i ~/ 2;
              if (index >= _array.length) {
                _array.addAll(
                    ['2 ^ $index = ${pow(2, index)}',
                      '2 ^ ${index+1} = ${pow(2, index+1)}',
                      '2 ^ ${index+2} = ${pow(2, index+2)}']
                );
              }
              return ListTile(title: Text(_array[index]));
            }
        )
    );
  }
}