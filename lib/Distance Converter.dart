import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DistanceConverter(),
  ));
}

class DistanceConverter extends StatefulWidget {
  @override
  _DistanceConverterState createState() => _DistanceConverterState();
}

class _DistanceConverterState extends State<DistanceConverter> {
  double meters = 0.0;
  double kilometers = 0.0;

  void convertMetersToKilometers() {
    setState(() {
      kilometers = meters / 1000;
    });
  }

  void convertKilometersToMeters() {
    setState(() {
      meters = kilometers * 1000;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Distance Converter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Meters to Kilometers'),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  meters = double.parse(value);
                });
              },
            ),
            ElevatedButton(
              onPressed: convertMetersToKilometers,
              child: Text('Convert'),
            ),
            Text('Result: ${kilometers.toStringAsFixed(2)} kilometers'),
            SizedBox(height: 20),
            Text('Kilometers to Meters'),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  kilometers = double.parse(value);
                });
              },
            ),
            ElevatedButton(
              onPressed: convertKilometersToMeters,
              child: Text('Convert'),
            ),
            Text('Result: ${meters.toStringAsFixed(2)} meters'),
          ],
        ),
      ),
    );
  }
}
