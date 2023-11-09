import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  double _num1 = 0;
  String _operator = "";
  bool _isOperatorClicked = false;

  void _buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _clear();
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "/") {
      if (_isOperatorClicked) {
        _operator = buttonText;
      } else {
        _performOperation();
        _operator = buttonText;
        _isOperatorClicked = true;
      }
    } else if (buttonText == "=") {
      _performOperation();
      _operator = "";
    } else {
      if (_output == "0" || _isOperatorClicked) {
        _output = buttonText;
        _isOperatorClicked = false;
      } else {
        _output += buttonText;
      }
    }

    setState(() {
      _output;
    });
  }

  void _clear() {
    _output = "0";
    _num1 = 0;
    _operator = "";
    _isOperatorClicked = false;
  }

  void _performOperation() {
    if (_num1 == 0) {
      _num1 = double.parse(_output);
    } else {
      double num2 = double.parse(_output);
      switch (_operator) {
        case "+":
          _num1 = _num1 + num2;
          break;
        case "-":
          _num1 = _num1 - num2;
          break;
        case "x":
          _num1 = _num1 * num2;
          break;
        case "/":
          _num1 = _num1 / num2;
          break;
      }
    }
    _output = _num1.toString();
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.grey[300],
        ),
        onPressed: () => _buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              _output,
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("x"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("C"),
                  buildButton("0"),
                  buildButton("="),
                  buildButton("+"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
