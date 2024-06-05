class LocationInfo {
  LocationInfo({required this.id, required this.name, required this.longitude, required this.latitude});

  int id;
  String name;
  double longitude; // use like X coordinate
  double latitude; // use like Y coordinate

  String ImagePath='';
  String GetImagePath (bool complete){
    if(complete)
      return 'assets/images/${id}C.jpg';
    else
      return 'assets/images/${id}.jpg';
  }
}