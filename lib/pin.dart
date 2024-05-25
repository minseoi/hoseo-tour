import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hoseo_tour/data_manager.dart';
import 'package:hoseo_tour/location_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vector_math/vector_math.dart';

class Pin extends StatefulWidget {
  Pin({super.key, required this.id, required this.active});

  int id;
  bool active;

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
    LocationInfo? locationInfo;
    if(widget.id != -1) {
      locationInfo = DataManager().pinInfoList[widget.id];
    }

    return Container(
      width: 96,
      height: 32,
      child: widget.active?
      ElevatedButton(onPressed: (){setStamp(widget.id);}, child: Text('스탬프'))
      : Stack(
        children: [
          Center(child: Image(image: widget.id == -1? AssetImage('assets/images/user.png') : AssetImage('assets/images/pin.png'),)),
          if(widget.id != -1)
            Center(child: Text('${locationInfo!.name}' , textAlign: TextAlign.center, style: TextStyle(fontSize: 16,),)),
        ],
      ),
    );
  }

  Future<void> setStamp(int placeId) async {
    DataManager.stampData?.setBool('Place${placeId}', true);
  }
}