import 'package:http/http.dart' as http;
import 'ContestCard.dart';
import 'dart:convert';

class Data {
  List<Tag> data  = [];
  Future<void> getdata() async{
    String url = "https://contesttrackerapi.herokuapp.com/";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    jsonData['result']['upcoming'].forEach((element){
            Tag article = Tag(
              element['Name'],
              element['StartTime'],
              element['EndTime'],
              element['Platform'],
              element['url']
            );
            data.add(article);
    });

  }
}
