import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './contest.dart';


void main() {
  runApp(MyApp());
}
String Cname;
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
        color: Colors.lightGreenAccent,
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

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // String name;
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Card Example')),
        backgroundColor: Colors.purpleAccent,
        body: MyCardWidget(),
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the HomeScreen widget.
        //'/': (context) => MyApp(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => Contest(Cname),
      },
    );
  }
}

/// This is the stateless widget that the main application instantiates.
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


