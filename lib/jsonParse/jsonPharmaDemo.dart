
import 'package:dcolpharma/entities/pharmas.dart';
import 'package:dcolpharma/services/liaisons.dart';
import 'package:flutter/material.dart';

class JsonPharmaDemo extends StatefulWidget {
  JsonPharmaDemo():super();
  @override
  _JsonPharmaDemoState createState() => _JsonPharmaDemoState();
}


class _JsonPharmaDemoState extends State<JsonPharmaDemo> {
  List <Pharmas> _pharmas;
  bool _loading;
  final primary = Color(0xFF1b5e20);
  final secondary = Color(0xfff29a94);

/*Widget build (BuildContext context){
  final List<Map> pharmaLists = [
    {
      "name": Text("${pharma.company}"),
      "numero" :Text ("${pharma.phone}"),
      "location" :Text("${pharma.adress}"),
      "logoText" : "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"

    }];*/
  @override
  void initState(){
    _loading=true;

    Liaisons.getPharmas().then((pharmas){
      setState((){
        _pharmas= pharmas;
        _loading=false;
      });
    });
  }

    @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
    body: SingleChildScrollView(
    child:
     /* appBar: AppBar(
        title: Text(_loading? 'Loading...' : 'Pharmas'),
      ),*/
      Container (
        height:MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        child:Stack(
            children: <Widget>[
        Container(
        padding: EdgeInsets.only(top: 145),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,

        color: Colors.white,
        child:
          ListView.builder(
              itemCount: null== _pharmas ? 0 : _pharmas.length,
            itemBuilder: (context,index){
           Pharmas pharma = _pharmas[index];
           return ListTile(
             title: Text('${pharma.company}',
                 style:TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 24
                 )),
             subtitle: Text('Numéro: ${pharma.phone} \nLocation : ${pharma.address}',
                 style: TextStyle(
                   fontWeight: FontWeight.normal,
                   fontSize: 18,
                 ),),
           );
          },),

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
    style: TextStyle(
        color: primary,
        fontWeight: FontWeight.bold,
        fontSize: 18),
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
                //  image: NetworkImage(pharma[index]['logoText']),
                  fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
               pharmaLists[index]['name'],
                  style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 26),
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
                    Text(pharmaLists[index]['location'],
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
                  Text(pharmaLists[index] ['phone'],),

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
