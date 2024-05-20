import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hoseo_tour/data_manager.dart';
import 'package:hoseo_tour/pin.dart';
import 'package:vector_math/vector_math.dart';

class Map extends StatefulWidget {

  Map({required this.userPosition});

  Position userPosition;

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  static const double _mapImageSize = 1000;

  @override
  Widget build(BuildContext context) {

    List<Widget> pinWidgets = [];

    //장소 핀 추가
    for(final pinInfo in DataManager().pinInfoList){
      Vector2 thisPos = Pin.GetScreenPosition(pinInfo.longitude, pinInfo.latitude, _mapImageSize/2, _mapImageSize/2);

      pinWidgets.add(
          Positioned(
            child: Transform.translate(
                offset: DataManager().curMapOffset,
                child: Pin(name: pinInfo.name)
            ),
            top: thisPos.y - 32,
            left: thisPos.x - 48,
          )
      );
    }

    //유저 핀 추가
    Vector2 thisPos = Pin.GetScreenPosition(widget.userPosition.longitude, widget.userPosition.latitude, _mapImageSize/2, _mapImageSize/2);
    pinWidgets.add(
        Positioned(
          child: Transform.translate(
              offset: DataManager().curMapOffset,
              child: Pin(name: '@유저@')
          ),
          top: thisPos.y - 32,
          left: thisPos.x - 48,
        )
    );


    return LayoutBuilder(  // LayoutBuilder 추가
      builder: (context, constraints) {
        // Map위젯이 보일 크기
        final containerWidth = constraints.maxWidth;
        final containerHeight = constraints.maxHeight;

        return GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              DataManager().curMapOffset += details.delta; // 드래그에 따라 offset을 업데이트

              // 이미지 드래그 범위 제한
              final double dxLimit = (_mapImageSize - containerWidth) / 2;
              final double dyLimit = (_mapImageSize - containerHeight) / 2;

              DataManager().curMapOffset = Offset(
                  DataManager().curMapOffset.dx.clamp(-dxLimit, dxLimit).toDouble(),
                  DataManager().curMapOffset.dy.clamp(-dyLimit, dyLimit).toDouble())
              ;
            });
          },
          child: Container(
            width: containerWidth,
            height: containerHeight,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            clipBehavior: Clip.antiAlias, // 위젯 영역 밖은 그리지 않음
            child: OverflowBox( //하위 위젯의 크기가 보여지는 영역보다 크게 만들기 위함
              maxWidth: double.infinity,
              maxHeight: double.infinity,
              child: Stack( // 제일 밑에 지도 이미지를 깔고, 그 위에 여러 오브젝트를 올릴 예정
                children: [
                  Transform.translate(
                    offset: DataManager().curMapOffset,
                    child: Image.asset('assets/images/map.png', width: _mapImageSize, height: _mapImageSize, fit: BoxFit.contain,),
                  ),
                  ...pinWidgets,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
