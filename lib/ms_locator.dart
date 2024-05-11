import 'package:geolocator/geolocator.dart';

class MsLocator {

  Future<Position> DeterminePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 위치 서비스 켜져 있는지 확인
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // 초기 권한은 denied이다.
    // 권한 확인하고 request
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    // 사용자가 설정에서 직접 변경 해 줘야 하는 상황
    // @TODO: 핸들링 필요
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}