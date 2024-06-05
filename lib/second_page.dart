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
                  switch (DataManager().pinInfoList[position].name) {
                    case '중앙 잔디':
                      AlertDialog dialog = AlertDialog(
                        content: Text(
                          '정문에서도 보이는 중앙잔디밭이다. 봄철에는 잔디를 밟지 못하게 줄을 쳐놓는다. 축제때 이곳에 무대를 설치한다.',
                          style: TextStyle(fontSize: 20),),
                      );
                      showDialog(context: context,
                          builder: (BuildContext context) => dialog);
                    case '학술 정보관':
                      AlertDialog dialog = AlertDialog(
                        content: Text(
                          '2015년 3월 학술정보관이라고 하고 대다수가 인산홀이라고 부르는 크고 아름다운 건물이 지어졌다. 학술정보관은 2015년 12월 24일에 우수시설학교에 선정되었는데, 한국교육시설학회의 전문가 심사를 통해 교육과정에의 적합성·대응성, 구조적·환경적 안전성과 쾌적성, 기능성, 사용자 편의성, 디자인 등을 종합적으로 평가받아 전국 대학 부문에서 대상에 선정되었다. 우수상은 서울대의 관정도서관이라고 한다. 호서대 건축학과 출신의 학생들이 직원으로 다수 속해있는 동우건축사사무소에서 디자인했다. 디자인 컨셉은 QR코드라고 한다. 건축학과 출신 졸업생의 기억에 따르면 초기 공사당시 건축학과 학생들이 "내가 디자인해도 저거보단 잘하겠다"며 불만이 많았으나 완공된 후 "생각보다 예쁜데?"라는 반응으로 바뀌었다. 실제로 많은 학생들이 가장 활발히 사용하고 있는 건물이다.',
                          style: TextStyle(fontSize: 20),),
                      );
                      showDialog(context: context,
                          builder: (BuildContext context) => dialog);
                    case '체육관':
                      AlertDialog dialog = AlertDialog(
                        content: Text(
                          '체육대학 학생들이 주로 쓰며 1층에는 실내체육장이 있다. 3월 입학식을 이곳에서 한다. 가끔 체육 강의를 듣기 위해 오후에 실내체육장을 가면 학군단 간부와 병사들이 배드민턴 치는걸 볼 수 있다.',
                          style: TextStyle(fontSize: 20),),
                      );
                      showDialog(context: context,
                          builder: (BuildContext context) => dialog);
                    case '강석규':
                      AlertDialog dialog = AlertDialog(
                        content: Text(
                          '본래 중앙도서관으로 사용되던 건물이나 학교 설립자인 강석규 총장의 이름을 딴 건물로 2015년 말 겨울부터 리모델링 공사가 시작되어 2016년 9월에 종료되었다. 대부분의 학생들은 아직도 중앙 도서관이라고 부른다. 원래는 없던 엘리베이터가 생기고, 건물이 훨씬 하얗고 반짝해졌다. 1층에는 학교 행정팀, 학사팀, 교목실, 예비군 연대 등이 있으며 2~5층에는 강의실이 있다. 지하 1층에는 GS25, 커피전문점, 생활용품점, 안경점, 문구&서점, 복사실이 있다. 지하와 외부 1층을 연결하는 야외 테라스(실제 명칭은 건축용어로 선큰가든이다.)를 만들었는데 경관이 제법 그럴싸 하다. HOSEO_WLAN 와이파이를 사용할 수 있다.',
                          style: TextStyle(fontSize: 20),),
                      );
                      showDialog(context: context,
                          builder: (BuildContext context) => dialog);
                    case '대학 교회':
                      AlertDialog dialog = AlertDialog(
                        content: Text(
                          '학생들이 채플을 들으러 자주 방문하는 곳으로 천장이 상당히 아름답기로 유명하다.',
                          style: TextStyle(fontSize: 20),),
                      );
                      showDialog(context: context,
                          builder: (BuildContext context) => dialog);
                    case '학생 식당':
                      AlertDialog dialog = AlertDialog(
                        content: Text(
                          '학생들과 교직원들이 식사를 할 수 있는 장소로 2021년 2학기에 리모델링을 하여 굉장히 깔끔하고 맛 또한 한층 업그레이드되었다.',
                          style: TextStyle(fontSize: 20),),
                      );
                      showDialog(context: context,
                          builder: (BuildContext context) => dialog);
                    case '2공학관':
                      AlertDialog dialog = AlertDialog(
                        content: Text(
                          '출입문이 1층 출입문 2개와 4층 출입문으로 나뉘어있다. 4층 출입문 앞에는 LED 전광판이 있다.',
                          style: TextStyle(fontSize: 20),),
                      );
                      showDialog(context: context,
                          builder: (BuildContext context) => dialog);
                    case '예술관':
                      AlertDialog dialog = AlertDialog(
                        content: Text(
                          '중앙잔디 기준 11시 방향에 예술대 건물이 두 개 있다. 구예대, 신예대라고 불린다. 구예대에는 디자인과 학생들이, 신예대는 문화예술학부와 연극과가 사용(거주)하고있다. 밤에 예대 쪽을 걷다보면 예대 1층 스튜디오에서 영상미디어전공이 영화 촬영을 하는 것을 볼 수 있고 구예대 2층 3층에서는 디자인과 학생들이 밤샘과제나 졸전준비하는것을 볼 수 있다. 물론 연극과의 연습실에서도 연습 소리가 들린다. 여러모로 밤이나 낮이나 핫한 건물.',
                          style: TextStyle(fontSize: 20),),
                      );
                      showDialog(context: context,
                          builder: (BuildContext context) => dialog);
                  }
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