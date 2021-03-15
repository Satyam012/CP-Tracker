import 'package:flutter/material.dart';
import 'progress.dart';

class Handles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:
        Row(
            children:[
              Text('CP',style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),),
              Text('-'),
              Text('Tracker',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              )),
            ]
        ),
        ),
        body: MyCustomForm(),
        backgroundColor: Colors.pink[50],
    );

  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {

  final _formKey = GlobalKey<FormState>();
  String cc,cf,lc;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 400,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Enter your Codechef Handle',
                labelText: 'CodeChef',
              ),
              onChanged: (text){
                cc=text;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Enter your CodeForces Handle',
                labelText: 'CodeForces',
              ),
              onChanged: (text){
                cf=text;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Enter your LeetCode Handle',
                labelText: 'LeetCode',
              ),
              onChanged: (text){
                lc=text;
              },
            ),
            SizedBox(height: 20,width: 20,),
            RaisedButton(
                child: const Text('View'),
                onPressed: ()
                {
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new Progress(cc,cf,lc)));
                }
            ),
          ],
        ),
      ),
    );
  }
}