import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class AdrLocation extends StatefulWidget {
  @override
  _AdrLocationState createState() => _AdrLocationState();
}

class _AdrLocationState extends State<AdrLocation> {
  Position _position;
  StreamSubscription<Position> _streamSubscription;
  Address _address;

  @override
  void initState(){
    super.initState();
    // ignore: unused_local_variable
    var locationOptions =  LocationOptions(accuracy:LocationAccuracy.high,distanceFilter:18);
    _streamSubscription = Geolocator.getPositionStream().listen((Position position){
      setState(() {
        print (position);
        _position = position;
        final coordinates = new Coordinates(position.latitude,position.longitude);
        AdrLocation(coordinates).then((value)=> _address = value);


      });

    });
}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:new Text('Find your location') ,
      ),body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              SizedBox(height:300),
               Text('Location lat: ${_position?.latitude?? '-'}, long:${_position?.longitude?? '-'}'),
              SizedBox(height:50),
              Text("Adress from coordinates :"),
              SizedBox(height:20),
               Text("${_address?.addressLine?? '-'}"),
        ]
      ),
    ),

    );

  }
  @override
  void dispose(){
    super.dispose();
    _streamSubscription.cancel();
  }






  // ignore: non_constant_identifier_names
  Future <Address> AdrLocation (Coordinates coordinates) async {
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return addresses.first;
  }
}
