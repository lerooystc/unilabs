import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  String area = "Введите значения";
  TextEditingController heightController = TextEditingController();
  TextEditingController widthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child:
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: widthController,
                decoration: const InputDecoration(labelText: "Ширина"),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp("[0-9]")),
                ],
                validator: (value)
                {
                  if (value!.isEmpty) return "Введите число";
                  return null;
                },
              ),
              const Padding(padding: EdgeInsets.all(20.0)),
              TextFormField(
                controller: heightController,
                decoration: const InputDecoration(labelText: "Высота"),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp("[0-9]")),
                ],
                validator: (value)
                {
                  if (value!.isEmpty) return "Введите число";
                  return null;
                },
              ),
              const Padding(padding: EdgeInsets.all(20.0)),
              ElevatedButton(
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        area = "S = ${widthController.text} * ${heightController.text} ="
                            " ${int.parse(widthController.text) * int.parse(heightController.text)}";
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Площадь рассчитана"),
                        backgroundColor: Colors.green,)
                      );
                    }
                  },
                  child: const Text('Рассчитать площадь')),
              const Padding(padding: EdgeInsets.all(20.0)),
              Text(area)
            ],
          )
        )
    );
  }
}

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: const Text('Калькулятор площади')),
      body: const MyForm()
    )
  )
);
