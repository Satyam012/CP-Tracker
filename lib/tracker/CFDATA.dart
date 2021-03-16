import 'package:http/http.dart' as http;
import 'dart:convert';

class CFdata {
  var cf = new Map();
  var str;

  CFdata(this.str);

  Future<void> getdata() async {
    if (str.length > 1) {
      String url = "https://competitive-coding-api.herokuapp.com/api/codeforces/$str";
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);

      if (jsonData["status"] == "Success") {
        cf["rating"] = jsonData["rating"];
        cf["max_rating"] = jsonData["max rating"];
        cf["rank"] = jsonData["rank"];
        cf["max_rank"] = jsonData["max rank"];
      }
      else {
        cf["rating"] = "None";
        cf["max_rating"] = "None";
        cf["rank"] = "None";
        cf["max_rank"] = "None";
      }
    }
    else {
      cf["rating"] = "None";
      cf["max_rating"] = "None";
      cf["rank"] = "None";
      cf["max_rank"] = "None";
    }
  }
}