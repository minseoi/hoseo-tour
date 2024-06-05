import 'dart:ui';

import 'package:hoseo_tour/location_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataManager {
  static final DataManager _instance = DataManager._privateConstructor();
  DataManager._privateConstructor() {
    _loadStampData();
    pinInfoList.add(LocationInfo(id: 0, name: "중앙 잔디", longitude: 127.0751233, latitude: 36.73639));
    pinInfoList.add(LocationInfo(id: 1, name: "학술 정보관", longitude: 127.0763667, latitude: 36.7373017));
    pinInfoList.add(LocationInfo(id: 2, name: "체육관", longitude: 127.072505, latitude: 36.737585));
    pinInfoList.add(LocationInfo(id: 3, name: "강석규", longitude: 127.07476, latitude: 36.7357483));
    pinInfoList.add(LocationInfo(id: 4, name: "대학 교회", longitude: 127.07523, latitude: 36.7381017));
    pinInfoList.add(LocationInfo(id: 5, name: "학생 식당", longitude: 127.0763617, latitude: 36.736355));
    pinInfoList.add(LocationInfo(id: 6, name: "2공학관", longitude: 127.0731483, latitude: 36.7365017));
    pinInfoList.add(LocationInfo(id: 7, name: "예술관", longitude: 127.0752033, latitude: 36.7349717));
  }

  void _loadStampData() async {
    stampData = await SharedPreferences.getInstance();
  }

  factory DataManager() {
    return _instance;
  }

  // 사용할 변수들 이 아래에 작성
  List<LocationInfo> pinInfoList = List.empty(growable: true);

  final double baseLatitude = 36.73639;
  final double baseLongitude = 127.0751233;

  Offset curMapOffset = Offset.zero;

  static SharedPreferences? stampData;
}