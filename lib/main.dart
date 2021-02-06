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
        appBar: AppBar(title: Text('CP-Tracker')),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  a.getcard(context,"CodeChef"),
                  a.getcard(context,"CodeForces"),
                ],
              ),
              Row(
                children: [
                  a.getcard(context,"HackerEarth"),
                  a.getcard(context,"LeetCode"),
                ],
              ),
              Row(
                children: [
                  a.getcard(context,"AtCoder"),
                  a.getcard(context,"HackerRank"),
                ],
              ),
              Row(
                children: [
                  a.getcard(context,"TopCoder"),
                  a.getcard(context,"Kick Start"),
                ],
              )
            ],
          ),
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
