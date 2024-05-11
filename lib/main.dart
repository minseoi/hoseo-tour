import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hoseo_tour/first_page.dart';
import 'package:hoseo_tour/ms_locator.dart';
import 'package:hoseo_tour/second_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController? controller;
  MsLocator locator = MsLocator();
  Position? userPosition;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TabBarView(
          children: [FirstPage(userPosition: userPosition,), SecondPage()],
          physics: NeverScrollableScrollPhysics(), //스와이프로 탭 이동 방지
          controller: controller,
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.map_outlined, color: Colors.deepOrangeAccent,)),
            Tab(icon: Icon(Icons.list, color: Colors.deepOrangeAccent,)),
          ],
          controller: controller,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);

    locator.DeterminePosition().then((position) {
      print('curPos: ${position.longitude}, ${position.latitude}');
      setState(() {
        userPosition = position;
      });
    }).onError((error, stackTrace) {
      print(error.toString());
      // @TODO: 위치를 가져올 수 없으면 강제 종료
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}


