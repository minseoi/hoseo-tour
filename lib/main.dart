import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hoseo_tour/first_page.dart';
import 'package:hoseo_tour/ms_locator.dart';
import 'package:hoseo_tour/second_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

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
      theme: ThemeData(
        primaryColor: const Color(0xffAE2D2C),
      ),
      home: Scaffold(
        body: TabBarView(
          children: [FirstPage(userPosition: userPosition,), SecondPage()],
          physics: NeverScrollableScrollPhysics(), //스와이프로 탭 이동 방지
          controller: controller,
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.map_outlined,)),
              Tab(icon: Icon(Icons.list,)),
            ],
            controller: controller,
            labelColor: Colors.white,
            unselectedLabelColor: Color(0xffAE2D2C),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(color: Color(0xffAE2D2C)),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);

    _initUserPosition();
  }

  void _initUserPosition() async {
    try{
      userPosition = await locator.DeterminePosition();
      print('curPos: ${userPosition?.longitude}, ${userPosition?.latitude}');

      setState(() {
      });
    } catch(error) {
      print(error);
      // @TODO: Error Handling
    }
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}


