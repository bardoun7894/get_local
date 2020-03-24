import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_local/screens/login_screen.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  var location = new Location();
  Map<String, double> userLocation;
List data=[];
  @override
  Widget build(BuildContext context)   {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Container(child: Text(""),),
     );
  }

  Widget LocationCenter(){
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () {

                location.onLocationChanged().listen((Map<String,double> currentLocation) {
//                    print(currentLocation["latitude"]);
//                    print(currentLocation["longitude"]);
                  String latitude=" latitude : "+currentLocation["latitude"].toString();
                  String longitude=" longitude :"+currentLocation["longitude"].toString();
                  DateTime now = DateTime.now();
                  String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
                  data.add(latitude);
                  data.add(longitude);
                  data.add(formattedDate);
                  for(int i =0 ;i<data.length; i++){
                    if(i% 3 ==0) {
                      print("----------");
                    }
                    print (data[i]);
                    Timer(Duration(seconds: 5),() {
                      print("****%5*****");
                      print(  latitude);
                      print("*********");
                    });
                  }
                });
              },
              color: Colors.blue,
              child: Text("Get Location", style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
  Future<Map<String, double>> _getLocation() async {
    var currentLocation = <String, double>{};
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

}
