import 'package:http/http.dart' as http;
import 'dart:convert';

class LCdata {
  var lc= new Map();
  var str;
  bool flag=false;
  LCdata(this.str);
  Future<void> getdata() async{
    if(str.length>1){
      String url = "https://competitive-coding-api.herokuapp.com/api/leetcode/$str";
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);

      if(jsonData["status"]=="Success"){
        flag=true;
        lc["ranking"]=jsonData["ranking"];
        lc["total_problems_solved"]=jsonData["total_problems_solved"];
        lc["easy_questions_solved"]=jsonData["easy_questions_solved"];
        lc["medium_questions_solved"]=jsonData["medium_questions_solved"];
        lc["hard_questions_solved"]=jsonData["hard_questions_solved"];
        lc["contribution_points"]=jsonData["contribution_points"];
      }
      else{
        lc["ranking"]="None";
        lc["total_problems_solved"]="None";
        lc["easy_questions_solved"]="None";
        lc["medium_questions_solved"]="None";
        lc["hard_questions_solved"]="None";
        lc["contribution_points"]="None";
      }
    }
    else{
      lc["ranking"]="None";
      lc["total_problems_solved"]="None";
      lc["easy_questions_solved"]="None";
      lc["medium_questions_solved"]="None";
      lc["hard_questions_solved"]="None";
      lc["contribution_points"]="None";
    }
  }
}
