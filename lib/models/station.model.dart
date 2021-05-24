class Station {
  final String stationName;
  final String stationCode;

  Station({
    this.stationName,
    this.stationCode,
  });

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      stationName: json['stationName'] as String,
      stationCode: json['stationCode'] as String,
    );
  }
}
