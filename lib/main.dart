import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController;
  TextEditingController heightController;

  String _message = "Informe os valores";

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _message = "Informe os valores";
    });
  }

  void _calculateImc() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;

      double imc = weight / (height * height);

      if (imc < 18.6) {
        _message = "Você está abaixo do peso, IMC: ${imc.toStringAsPrecision(4)}";
      }
          
      if (imc >= 18.6 && imc < 24.9) {
        _message = "Peso ideal, IMC: ${imc.toString()}";
      }
          
      if (imc >= 24.9 && imc < 29.9) {
        _message = "Levemente acima do peso, IMC: ${imc.toString()}";
      }
          
      if (imc >= 29.9 && imc < 34.9) {
        _message = "Obesidade grau I, IMC: ${imc.toString()}";
      }
          
      if (imc >= 34.9 && imc < 39.9) {
        _message = "Obesidade grau II, IMC: ${imc.toString()}";
      }
          
      if (imc >= 40) {
        _message = "Obesidade grau III, IMC: ${imc.toString()}";
      }

    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetFields ,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 120,
                color: Colors.green,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Informe seu peso (kg): ",
                  labelStyle: TextStyle(color: Colors.green),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25),
                controller: weightController,
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Informe sua altura (cm): ",
                      labelStyle: TextStyle(color: Colors.green),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25),
                    controller: heightController,
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Container(
                  height: 50,
                  child: RaisedButton(
                    onPressed: _calculateImc,
                    child: Text("Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ),
              Text(
                _message,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25),
              )
            ],
          ),
        ));
  }
}
