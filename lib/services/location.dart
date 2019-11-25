import 'package:geolocator/geolocator.dart';

  // enum posation{
  //   latilute,
  //   longitute
  // }

class Location{
  double altitude;
  double latitude;
   Future<void> getCurrentlocation() async {
       try{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
 //print(position.latitude + position.altitude);
 altitude = position.altitude;
 latitude = position.latitude;
       }
       catch(e){
         print(e);
       }
  }
 

}