import 'package:flutter/material.dart';
import 'getdata.dart';
import 'package:url_launcher/url_launcher.dart';


class Allcontest extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Detail(),
    );
  }
}

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool loading;
  var tagObjs;

  void getcontest() async {
    Data object = Data();
    await object.getdata();
    tagObjs = object.data;

    setState(() {
      loading = false;
      // tagObjs.sort();
    });
  }

  @override
  void initState() {
    loading = true;
    super.initState();
    getcontest();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child:  loading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
        child: Column(
            children:[
              for(int i=0;i<tagObjs.length;i++)
                if(tagObjs[i].Platform=="LeetCode"||tagObjs[i].Platform=="CodeForces"||tagObjs[i].Platform=="AtCoder"||tagObjs[i].Platform=="Kick Start"||tagObjs[i].Platform=="Kick Start")
                  Customcard(tagObjs[i].Name,tagObjs[i].Platform,tagObjs[i].StartTime,tagObjs[i].EndTime,tagObjs[i].url)
            ]
        ),
      ),
    );
  }
}
String convert(String s){
  String time=s.substring(0,10);
  int mm=int.parse(s.substring(14,16))+30;
  int hh=int.parse(s.substring(11,13))+5;
  String ss=s.substring(17,19);
  if(mm>=60) {
    hh++;
    mm%=60;
  }
  hh%=24;
  String h=hh.toString(),m=mm.toString();
  if(h.length==1)h='0'+h;
  if(m.length==1)m='0'+m;
  return' $time  $h:$m:$ss';
}

Widget Customcard(String Name,String platform,String Starttime,String Endtime,String url){

  String stime=convert(Starttime);
  String etime=convert(Endtime);
  return Card(
    color: Colors.cyan[50],
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: Image.asset('assets/$platform.png'),
          title: Text('\n$Name'),
          subtitle: Text('\nSTART-TIME: $stime\n\nEND-TIME: $etime'),
        ),
        SizedBox(height: 10),
        Container(
          child: new RaisedButton(
            onPressed: (){
              launchURL(url);
            },
            child: new Text('Open'),
          ),
        ),
        SizedBox(height: 20),
      ],
    ),
  );
}

launchURL(String url) async {
  await launch(url);
}