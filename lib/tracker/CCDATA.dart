import 'package:http/http.dart' as http;
import 'dart:convert';

class CCdata {
  var cc= new Map();
  var str;
  CCdata(this.str);
  Future<void> getdata() async{
    if(str.length>1){
      var response = await http.get("https://competitive-coding-api.herokuapp.com/api/codechef/$str");
      var jsonData = jsonDecode(response.body);

      if(jsonData["status"]=="Success"){
        cc["rating"]=jsonData["rating"];
        cc["star"]=jsonData["stars"];
        cc["highest_rating"]=jsonData["highest_rating"];
        cc["global_rank"]=jsonData["global_rank"];
        cc["country_rank"]=jsonData["country_rank"];
      }
      else{
        cc["rating"]="None";
        cc["star"]="None";
        cc["highest_rating"]="None";
        cc["global_rank"]="None";
        cc["country_rank"]="None";
      }
    }
    else{
      cc["rating"]="None";
      cc["star"]="None";
      cc["highest_rating"]="None";
      cc["global_rank"]="None";
      cc["country_rank"]="None";
    }
  }
}
