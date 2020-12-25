import 'dart:convert';
import 'package:http/http.dart';
import 'package:silent_hill_intern/json_code/PODO.dart';
import 'package:silent_hill_intern/json_code/toJSON.dart';

class Network{                                                                  //For fetching the data
  final String url;

  Network(this.url);

  Future<PostList> fetchData() async{
    Response response = await get(Uri.encodeFull(url));

    if(response.statusCode == 200){
      print("OK");
      return PostList.fromJSON(json.decode(response.body));
    }else{
      throw Exception("There was a problem in fetching data from server");
    }
  }

  Future postData(Postsend data) async{

    Response response = await post(url,body: jsonEncode(data.toJSON()), headers:{'Content-type': 'application/json; charset=UTF-8',});

    if(response.statusCode == 201){
      print("Data Sent");
    }else{
      print("ERROR");
    }

  }

}
