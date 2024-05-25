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

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
         height: double.infinity,
         decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage('assets/images/field.jpg'),fit: BoxFit.cover
           )
         ),

           child: Center(

            child: Column( children: <Widget>[

              Image.asset('assets/images/hoseo.png', width: 600, height: 500,),
              Positioned(
                top: 200, left: 230,
                child: ElevatedButton(style: ElevatedButton.styleFrom(
                  minimumSize: Size(170, 70),
                  textStyle: TextStyle(fontSize: 32),
                  backgroundColor: Colors.red[400],
                  foregroundColor: Colors.white,
                ),
                    child: Text('시작'),
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => school_stamp_tour()));
                    } ),
              ),



            ],
                   ),
         ),
      ),
      ),
    );
  }
}



class school_stamp_tour extends StatefulWidget {
  @override
  State<school_stamp_tour> createState() => _stamptourState();
}

class _stamptourState extends State<school_stamp_tour> with SingleTickerProviderStateMixin {
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

      // 1m마다 위치 업데이트
      final LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 1,
      );
      StreamSubscription<Position> positionStream = Geolocator.getPositionStream(locationSettings: locationSettings).listen(
              (Position? position) {
            userPosition = position;
            setState(() {
            });
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


