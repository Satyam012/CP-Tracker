import 'package:http/http.dart' as http;
import 'ContestCard.dart';
import 'dart:convert';

class Data {
  List<Tag> data  = [];

  Future<void> getdata() async{
    String url = "https://www.kontests.net/api/v1/all";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    jsonData.forEach((element){
            //print(element);
            Tag article = Tag(
              element['end_time'],
              element['name'],
              element['start_time'],
              element['site'],
              element['url']
            );
            // article.sort();
            data.add(article);
    });
  }
}
