import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hoseo_tour/map.dart';

class FirstPage extends StatelessWidget {

  FirstPage({required this.userPosition});

  Position? userPosition;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: userPosition != null ? Map(userPosition: userPosition!,) :
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('위치정보 가져오는 중...')
              ],
            )
    );
  }
}