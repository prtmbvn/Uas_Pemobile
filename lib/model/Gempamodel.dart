class Earthquake {
  final String tanggal;
  final String jam;
  final double magnitude;
  final String lokasi;

  Earthquake({
    required this.tanggal,
    required this.jam,
    required this.magnitude,
    required this.lokasi,
  });

  factory Earthquake.fromJson(Map<String, dynamic> json) {
    return Earthquake(
      tanggal: json['Tanggal'],
      jam: json['Jam'],
      magnitude: double.parse(json['Magnitude'].toString()),
      lokasi: json['Wilayah'],
    );
  }
}