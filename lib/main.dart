import 'dart:async';
import'dart:convert';
import 'package:drogstore/Screen/views.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState()=> new HomePageState(); 
}

class HomePageState extends State <HomePage>{
  

Future <String> getPharma() async{
    http.Response response = await http.get (
      Uri.encodeFull("https://jsonplaceholder.typicode.com/albums"),
      headers:{
        "Accept" :"application/json",
      }
    );
    print (response.body);
    List  data = json.decode(response.body);
    print(data);
      }

  @override
  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    debugShowCheckedModeBanner:false;
    return new Scaffold(
      body:new Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushReplacement(context,MaterialPageRoute(builder:(BuildContext)=>PharmaList()));
          },
          child: new Text("Get Pharma"),
          //child: new  MaterialApp(home: getPharma()),

        ),
      ),

     /* 
      title: 'PharmaLists',
      theme: ThemeData(

        primarySwatch: Colors.green,
      ), */
      //home:  MyApp(),
      //PharmaList(),
    );
  }
}

