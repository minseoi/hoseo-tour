import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hoseo_tour/data_manager.dart';
import 'package:vector_math/vector_math.dart';

class Pin extends StatefulWidget {
  Pin({super.key, required this.name});

  String name;

  @override
  State<StatefulWidget> createState() {
    return _Pin();
  }

  static Vector2 GetScreenPosition(double longitude, double latitude, double centerW, double centerH)
  {
    Vector2 Ret = Vector2.zero();
    double distance = Geolocator.distanceBetween(DataManager().baseLatitude, DataManager().baseLongitude, latitude, longitude);
    var start = Vector2(DataManager().baseLongitude, DataManager().baseLatitude);
    var end = Vector2(longitude, latitude);
    Vector2 nDir = (end - start).normalized();
    nDir *= distance * 1; //scale
    Vector2 center = Vector2(centerW, centerH);
    nDir.y = -nDir.y;
    Ret =  center += nDir;

    return Ret;
  }
}

class _Pin extends State<Pin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 32,
      child: Stack(
        children: [
          Center(child: Image(image: AssetImage('assets/images/pin.png'),)),
          Center(child: Text('${widget.name}' , textAlign: TextAlign.center, style: TextStyle(fontSize: 16,),)),
        ],
      ),
    );
  }

}