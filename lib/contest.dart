import 'package:flutter/material.dart';
import 'getdata.dart';

String Str;
class Contest extends StatelessWidget {
  final String name;
  Contest(this.name);
  @override
  Widget build(BuildContext context) {
    Str=name;
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(),
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
      //print(tagObjs);
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
              if(tagObjs[i].Platform==Str)
                Customcard(tagObjs[i].Name,tagObjs[i].Platform,tagObjs[i].StartTime,tagObjs[i].EndTime,tagObjs[i].url)
          ]
      ),
    ),
    );
  }
}

Widget Customcard(String Name,String platform,String Starttime,String Endtime,String url){

  return Card(
    color: Colors.lightGreenAccent,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: Image.asset('assets/$platform.png'),
          title: Text('\n$Name'),
          subtitle: Text('\nSTART-TIME: $Starttime\n\nEND-TIME: $Endtime'),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            RaisedButton(
              child: const Text('OPEN'),
              onPressed: (){},
            ),
            const SizedBox(width: 8),
          ],
        ),
      ],
    ),
  );
}

