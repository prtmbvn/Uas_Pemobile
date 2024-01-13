import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/Gempamodel.dart';

class EarthquakeService {
  Future<List<Earthquake>> getEarthquakeData() async {
    final response = await http.get(
      Uri.parse('https://data.bmkg.go.id/dataMKG/TEWS/gempaterkini.json'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(utf8.decode(response.bodyBytes));
      final List<dynamic> earthquakeList = jsonData['Infogempa']['gempa'];
      return earthquakeList.map((data) => Earthquake.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load earthquake data');
    }
  }
}