import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TemperatureConverter(),
  ));
}

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  double celsius = 0.0;
  double fahrenheit = 32.0;

  void convertCelsiusToFahrenheit() {
    setState(() {
      fahrenheit = (celsius * 9/5) + 32;
    });
  }

  void convertFahrenheitToCelsius() {
    setState(() {
      celsius = (fahrenheit - 32) * 5/9;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Celsius to Fahrenheit'),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  celsius = double.parse(value);
                });
              },
            ),
            ElevatedButton(
              onPressed: convertCelsiusToFahrenheit,
              child: Text('Convert'),
            ),
            Text('Result: ${fahrenheit.toStringAsFixed(2)}°F'),
            SizedBox(height: 20),
            Text('Fahrenheit to Celsius'),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  fahrenheit = double.parse(value);
                });
              },
            ),
            ElevatedButton(
              onPressed: convertFahrenheitToCelsius,
              child: Text('Convert'),
            ),
            Text('Result: ${celsius.toStringAsFixed(2)}°C'),
          ],
        ),
      ),
    );
  }
}
