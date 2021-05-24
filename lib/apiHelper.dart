import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:railways_api/models/station.model.dart';

class ApiHelper {
  Dio dio;
  ApiHelper() {
    var options = BaseOptions(
      baseUrl: "https://indianrailways.p.rapidapi.com",
    );
    dio = Dio(options);
  }

  Future<List<Station>> getStations(String station) async {
    try {
      final response = await dio.get(
        '/findstations.php',
        options: Options(
          headers: {
            "x-rapidapi-key":
                "8e9c68528bmsh2a4f0865cb92ed0p150ad1jsndf235b1097e4",
            "x-rapidapi-host": "indianrailways.p.rapidapi.com",
            "useQueryString": true,
          },
        ),
        queryParameters: {
          "station": station,
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> res = response.data;
        List<dynamic> body = res["stations"]; // [....] = []
        List<Station> stationsList =
            body.map((dynamic station) => Station.fromJson(station)).toList();

        return stationsList;
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode;
      }
    } catch (e) {
      print(e);
    }
  }
}
