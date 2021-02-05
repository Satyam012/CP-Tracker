import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './contest.dart';

String Cname;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[90],
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Card Example')),
        backgroundColor: Colors.pink[50],
        body: MyCardWidget(),
      ),
      initialRoute: '/',
      routes: {
        '/second': (context) => Contest(Cname),
      },
    );
  }
}


class MyCardWidget extends StatelessWidget {
  MyCardWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var a=new Customcard();
    return Center(
        child: Column(
          children: [
            Row(
              children: [
                a.getcard(context,"CODECHEF"),
                a.getcard(context,"CODEFORCES"),
              ],
            ),
            Row(
              children: [
                a.getcard(context,"HACKEREARTH"),
                a.getcard(context,"LEETCODE"),
              ],
            ),
            Row(
              children: [
                a.getcard(context,"ATCODER"),
                a.getcard(context,"OTHER"),
              ],
            )
          ],
        )
    );
  }
}


class Customcard{
  getcard(var context,String name){
    return Container(
      width: 180,
      height: 200,
      padding: new EdgeInsets.all(5.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.green[200],
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 10),
            Center(
              child:Image.asset('assets/$name.png',
                height: 80,
                width: 80,
              ),
            ),
            Text(name,style: TextStyle(fontSize: 22.0),),
            RaisedButton(
                child: const Text('View'),
                onPressed: ()
                {
                  Cname=name;
                  Navigator.pushNamed(context, '/second');
                }
            ),
          ],
        ),
      ),
    );
  }
}
