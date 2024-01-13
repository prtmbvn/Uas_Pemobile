import 'package:flutter/material.dart';
import '../Model/Gempamodel.dart';
import '../RestAPI/service.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gempa Bumi Terkini',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: EarthquakePage(),
    );
  }
}

class EarthquakePage extends StatefulWidget {
  @override
  _EarthquakePageState createState() => _EarthquakePageState();
}

class _EarthquakePageState extends State<EarthquakePage> {
  final EarthquakeService _earthquakeService = EarthquakeService();
  late List<Earthquake> earthquakeData;

  @override
  void initState() {
    super.initState();
    _loadEarthquakeData();
  }

  Future<void> _loadEarthquakeData() async {
    try {
      List<Earthquake> data = await _earthquakeService.getEarthquakeData();
      setState(() {
        earthquakeData = data;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gempa Bumi Terkini'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: earthquakeData.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  title: Text(
                    'Magnitude: ${earthquakeData[index].magnitude.toStringAsFixed(1)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 4),
                      Text('Tanggal: ${earthquakeData[index].tanggal}'),
                      SizedBox(height: 4),
                      Text('Jam: ${earthquakeData[index].jam}'),
                      SizedBox(height: 4),
                      Text('Lokasi: ${earthquakeData[index].lokasi}'),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}