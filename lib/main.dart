import 'package:flutter/material.dart';
import './contest.dart';
import './tracker/Handle.dart';
import 'allcontest.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
                children:[
                  Text('CP',style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),),
                  Text('-'),
                  Text('Tracker',style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold
                  )),
                ]
            ),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: "Home"),
                Tab(icon: Icon(Icons.search), text: "Track"),
                Tab(icon: Icon(Icons.leaderboard), text: "Contest"),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          body: TabBarView(
            children: [
              MyCardWidget(),
              MyCustomForm(),
              Allcontest(),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyCardWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var a=new Customcard();

    return Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  a.getcard(context,"CodeChef"),
                  a.getcard(context,"CodeForces"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  a.getcard(context,"HackerEarth"),
                  a.getcard(context,"LeetCode"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  a.getcard(context,"AtCoder"),
                  a.getcard(context,"HackerRank"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          // mainAxisSize: MainAxisSize.min,
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
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new Contest(name)));
                }
            ),
          ],
        ),
      ),
    );
  }
}

