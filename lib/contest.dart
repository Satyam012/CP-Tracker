import 'package:cptracker/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'ContestCard.dart';

Widget Customcard(String Name,String platform,String Starttime,String Endtime){
  return Card(
      color: Colors.lightGreenAccent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Image.asset('assets/$platform.png',
              height: 100,
              width: 50,
            ),
            title: Text('\n$Name'),
            subtitle: Text('\nSTART-TIME: $Starttime\n\nEND-TIME: $Endtime'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('OPEN'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
}
String Str;
class Contest extends StatelessWidget {
  final String name;
  Contest(this.name);
  @override
  Widget build(BuildContext context) {
    Str=name;
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar: AppBar(),
      body: Detail(),
    );
  }
}
List<Tag> tagObjs;
class Detail extends StatelessWidget {

  void getData() async{
    http.Response response = await http.get('https://contesttrackerapi.herokuapp.com/');
    var tagObjsJson = jsonDecode(response.body)['result']['upcoming'] as List;
    tagObjs = tagObjsJson.map((tagJson) => Tag.fromJson(tagJson)).toList();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children:[
            for(int i=0;i<tagObjs.length;i++)
            if(tagObjs[i].Platform==Str)
            Customcard(tagObjs[i].Name,Str,tagObjs[i].StartTime,tagObjs[i].EndTime)
            
          ]
        ),
      ),
    );
  }
}


