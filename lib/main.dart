import 'dart:async';
import'dart:convert';
import 'dart:core';
///import 'package:drogstore/Screen/views.dart';
import 'package:drogstore/entities/pharma.dart';
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

  final TextStyle dropdownMenuItem =
  TextStyle(color: Colors.black, fontSize: 18);
  final primary = Colors.green;
  final secondary = Color(0xfff29a94);

  List<Pharma> _pharmas = <Pharma>[];
  //final List<Pharma> getPharma();

  Future<List<dynamic>> getPharma() async{
        var url='https://www.json-generator.com/#';
        var response = await http.get(url);
         List <dynamic> pharmas  ;
   
        if (response.statusCode ==200){
        var  datas = json.decode(response.body);
        
         for(var data in datas){
         pharmas.add(Pharma.fromJson(data));
          }
        }
        // print(pharmas);
      return _pharmas; 
  }
  
    @override
    void initState(){
      
     getPharma().then((value){
       print(value);
        setState((){
        _pharmas = value;
        });
      });
      super.initState();
    }
    //This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
          
         // final List<Map<dynamic,dynamic>> pharmaLIsts = [
            final List<Map> pharmaLists = [
    {
          "name" :'duehu',
       //"${_pharmas[index].name}",
          //_pharmas['name'][index],
            "numero" : 11111111,
            "location" : "location 1",
            "logoText" : "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"
      
          },
          {
            "name" : "hsefuhzuf",
            "numero" : 11111111,
            "location" : "location 1",
            "logoText" : "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"
          },
          {
            "name" : "Pharmacie 1",
            "numero" : 11111111,
            "location" : "location 1",
            "logoText" : "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"
          },
          {
            "name" : "Pharmacie 1",
            "numero" : 11111111,
            "location" : "location 1",
            "logoText" : "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"
          },
          {
            "name" : "Pharmacie 1",
            "numero" : 11111111,
            "location" : "location 1",
            "logoText" : "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"
          },
          {
            "name" : "Pharmacie 1",
            "numero" : 11111111,
            "location" : "location 1",
            "logoText" : "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"
          },
          {
            "name" : "Pharmacie 1",
            "numero" : 11111111,
            "location" : "location 1",
            "logoText" : "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"
          },
          {
            "name" : "Pharmacie 1",
            "numero" : 11111111,
            "location" : "location 1",
            "logoText" : "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"
          },
        ];


       return Scaffold(
         backgroundColor: Color(0xfff0f0f0),
         body: SingleChildScrollView(
           child: Container(
             height:MediaQuery.of(context).size.height,
             width:MediaQuery.of(context).size.width,
             child: Stack(
               children: [
                 Container(
                   padding: EdgeInsets.only(top: 145),
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: _pharmas.length,
                      itemBuilder:(BuildContext context,int index){
                          return buildList(context,index);
                      }
                    ),
                 ),
                  Container(
                      height: 140,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
      
                            Text(
                              "DcolPharma",
                              style: TextStyle(color: Colors.white, fontSize: 24),
                            ),
      
      
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 110,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              child: TextField(
                                // controller: TextEditingController(text: locations[0]),
                                cursorColor: Theme.of(context).primaryColor,
                                style: dropdownMenuItem,
                                decoration: InputDecoration(
                                    hintText: "Search Pharmacies",
                                    hintStyle: TextStyle(
                                        color: Colors.black38, fontSize: 16),
                                    prefixIcon: Material(
                                      elevation: 0.0,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                      child: Icon(
                                          Icons.search,
                                          color:primary
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 13)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      
        Widget buildList(BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            width: double.infinity,
            height: 110,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(width: 3, color: secondary),
                    image: DecorationImage(
                        image: NetworkImage(_pharmas[index].location),
                        fit: BoxFit.fill),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _pharmas[index].name,
                        style: TextStyle(
                            color: primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: secondary,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(_pharmas[index].location,
                              style: TextStyle(
                                  color: primary, fontSize: 13, letterSpacing: .3)),
                        ],
                      ),
                 SizedBox(
                   height: 6,
                 ),
                      Row(
                        children:<Widget> [
                          Icon(
                            Icons.phone,
                            color: secondary,
                            size: 20,
                          ),
                          SizedBox(
                            width:5,
                          ),
                         //Text(_pharmas[index] ['numero'],),
                        
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
}
         
     /*  appBar: AppBar(       
        title: Text(
          "DcolPharma",
         //"${_pharmas}",
        ),
       backgroundColor:Colors.green
      ),
      body: ListView.builder(
        itemBuilder: (context,index){
          return Card(
            child:Padding(
              padding: const EdgeInsets.only(top:32.0,bottom:32.0,left: 16.0,right: 16.0 ) ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>
               [
                 Text( ' Name',  
                 //_pharmas[index].name,
                 style: TextStyle(
                   color: Colors.black,
                   fontSize: 20,
                   fontWeight: FontWeight.bold
                 ),
                 ),
                 Text(_pharmas[index].location,
                 style: TextStyle(
                   color: Colors.black,
                   fontSize: 20,
                   fontWeight:  FontWeight.normal
                  ),),
                 Text(_pharmas[index].numero,
                 style: TextStyle(
                   color: Colors.black,
                   fontSize: 20,
                   fontWeight:  FontWeight.normal),
                 ),
                 Text(_pharmas[index].departement,
                 style: TextStyle(
                   color: Colors.black,
                   fontSize: 20,
                   fontWeight:  FontWeight.normal),
                   ),
                 Text(_pharmas[index].arrondissement,
                 style: TextStyle(
                   color: Colors.black,
                   fontSize: 20,
                   fontWeight:  FontWeight.normal),
                   ),
               ],),
              )
          );
        },
        itemCount: _pharmas.length,
        
      ), */
      
      


     
  
       /*
       return new Scaffold(

        body:new Center(
          child: RaisedButton(
              onPressed: () {
              Navigator.pushReplacement(context,MaterialPageRoute(builder:(BuildContext)=>PharmaList()));
            },
            child: new Text("Get Pharma"),
            //child: new  MaterialApp(home: getPharma()),
  
          ),
        ), */
  
       /* 
        title: '_pharmas',
        theme: ThemeData(
  
          primarySwatch: Colors.green,
        ),   );
        */
        //home:  MyApp(),
        //PharmaList(),
    
    
  


