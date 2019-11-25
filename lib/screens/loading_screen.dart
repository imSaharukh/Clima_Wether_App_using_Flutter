import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = 'f3f8f777febdbe8ce08529f4b10f132b';
double altitude;
double latitude;



class LoadingScreen extends StatefulWidget {
  
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
 
  @override
  void initState() {
    getLoacation();
    super.initState();
  }
void getDate() async{
  
  http.Response response = await http.get('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$altitude&appid=$apiKey');
  
  print(response.statusCode);
  if(response.statusCode == 200){
    String data = response.body;
    var temp = jsonDecode(data)['main']['temp']; //main.temp
    var city = jsonDecode(data)['name'];
    print(temp);
    print(city);
  }

}  
void getLoacation() async {
  Location location = Location();
   await location.getCurrentlocation();
  latitude = location.latitude;
  altitude = location.altitude;
  print(location.altitude);
  print(location.latitude);
}
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
          // getlocation();
           getDate();

          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
