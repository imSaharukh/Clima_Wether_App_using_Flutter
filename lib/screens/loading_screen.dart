import 'package:flutter/material.dart';
import '../services/location.dart';
import '../services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = 'f3f8f777febdbe8ce08529f4b10f132b';
double longitude;
double latitude;
var url =
    'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLoacationData();

    super.initState();
  }

  void getLoacationData() async {
    Location location = Location();
    await location.getCurrentlocation();
    latitude = location.latitude;
    longitude = location.longitude;
    print('latitude:$latitude');
    print('longitude:$longitude');
    Network network = Network(url);
    var wetherData = await network.getDate();
    print(wetherData['main']['temp'].round());
    print(location.latitude);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(wetherData);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 150.0,
        ),
      ),
    );
  }
}
