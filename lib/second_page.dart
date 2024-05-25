import 'package:flutter/material.dart';
import 'package:hoseo_tour/data_manager.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});


  @override
  State<StatefulWidget> createState() {
    return _SecondPage();
  }

}

class _SecondPage extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: ListView.builder(itemBuilder: (context, position) {
              return GestureDetector(
                child: Card(
                  child: Column(children: <Widget>[
                    Image.asset(
                      DataManager().pinInfoList[position].GetImagePath(
                      DataManager.stampData!.containsKey('Place$position')? DataManager.stampData!.getBool('Place$position') == true : false
                ),
                      height: 300,
                      width: 300,
                      fit: BoxFit.contain,
                    ),
                    Text(DataManager().pinInfoList[position].name, style: TextStyle(fontSize: 50))
                  ],
                  ),
                ),
                onTap: () {
                  AlertDialog dialog = AlertDialog(
                    content: Text(
                      '여기는 ${DataManager().pinInfoList[position].name}\t입니다.',
                      style: TextStyle(fontSize: 20),),
                  );
                  showDialog(context: context,
                      builder: (BuildContext context) => dialog);
                },
              );
            },
                itemCount: DataManager().pinInfoList.length)
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}