import 'package:geolocator/geolocator.dart';

// enum posation{
//   latilute,
//   longitute
// }

class Location {
  double longitude;
  double latitude;
  Future<void> getCurrentlocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      //print(position.latitude + position.longitude);
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
