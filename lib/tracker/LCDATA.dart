import 'package:http/http.dart' as http;
import 'dart:convert';

class LCdata {
  var lc= new Map();
  var str;
  LCdata(this.str);
  Future<void> getdata() async{
    String url = "https://competitive-coding-api.herokuapp.com/api/leetcode/$str";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData["status"]=="Success"){
      lc["ranking"]=jsonData["ranking"];
      lc["total_problems_solved"]=jsonData["total_problems_solved"];
      lc["easy_questions_solved"]=jsonData["easy_questions_solved"];
      lc["medium_questions_solved"]=jsonData["medium_questions_solved"];
      lc["hard_questions_solved"]=jsonData["hard_questions_solved"];
      lc["contribution_points"]=jsonData["contribution_points"];
    }
  }
}
