import 'package:http/http.dart' as http;
import 'dart:convert';
class Network{
  String url;
  var temp;
  var city;
Network(this.url);

 Future getDate() async{
  
  http.Response response = await http.get(url);
  
  print(response.statusCode);
  if(response.statusCode == 200){
    String data = response.body;
    return jsonDecode(data);
  
  }

}  
}