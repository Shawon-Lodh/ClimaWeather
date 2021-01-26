import 'package:http/http.dart' as http;
import 'dart:convert';
class NetworkHelper{
  final String url;
  NetworkHelper({this.url});

  Future getData() async{
    http.Response response =  await http.get(url);
    //status code 200 means it is okk, and status code 404 means it is error.
    if (response.statusCode == 200){
      String data = response.body;
      // print(data);
      var decodeData = jsonDecode(data);
      return decodeData;
    }
    else{
      print(response.statusCode);
    }
  }
}