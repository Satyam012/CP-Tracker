import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'progress.dart';


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
  void initState() {
    cc=" ";cf=" ";lc=" ";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/logo3.png',
              // fit:BoxFit.cover,
                height: 180,
                width: 500,
              ),
              SizedBox(height: 20,width: 20,),
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
              SizedBox(height: 30,width: 20,),
              SizedBox(
                width: 80.0,
                height: 40.0,
                child: ElevatedButton(
                    child: const Text('View',style: TextStyle(fontSize: 20,color: Colors.black),),
                    onPressed: ()
                    {
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new Progress(cc,cf,lc)));
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}