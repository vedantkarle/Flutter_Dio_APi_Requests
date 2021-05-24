import 'package:flutter/material.dart';
import 'package:railways_api/apiHelper.dart';
import 'package:railways_api/models/station.model.dart';

class Stations extends StatefulWidget {
  @override
  _StationsState createState() => _StationsState();
}

class _StationsState extends State<Stations> {
  ApiHelper apiHelper = new ApiHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Railways",
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: apiHelper.getStations("delhi"),
          builder: (context, AsyncSnapshot<List<Station>> snapshot) {
            List<Station> stations = snapshot.data;
            if (snapshot.hasData) {
              return ListView(
                children: stations.map((station) {
                  return Container(
                    height: 50,
                    padding: EdgeInsets.all(
                      8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          station.stationName,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
