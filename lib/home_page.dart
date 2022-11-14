import 'dart:convert';
import 'dart:math';

import 'package:fitnessapp/model/fitnessModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String link =
      "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json?fbclid=IwAR1VdF7fMb6cLNiPOt9hMw3iHvZ7MBnK6JNS9zMnbdMkv-5Ntz5uurJZtfI";

  List<FitnessModel> allData = [];

  late FitnessModel fitnessModel;

  fatchData() async {
    var response = await http.get(Uri.parse(link));
    // print(response.body);
    var data = jsonDecode(response.body)["exercises"];
    for (var item in data) {
      fitnessModel = FitnessModel(
          id: item["id"],
          title: item["title"],
          thumbnail: item["thumbnail"],
          gif: item["gif"],
          seconds: item["seconds"]);
      allData.add(fitnessModel);
    }
    // print(allData.length);
  }

  @override
  void initState() {
    fatchData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List clr = [
      Color(0xffD1D4F3),
      Color(0xffB7FFE5),
      Color(0xffFFEFB7),
      Color(0xffFFE0FC)
    ];
    List textClr = [
      Color(0xfffffefd),
      Color(0xff939BF9),
      Color(0xff3ED09B),
      Color(0xffFFFEFD),
    ];
    var rnd = Random().nextInt(3) + 1;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu_outlined,
                color: Colors.black,
              )),
        ),
        body: GridView.count(
          childAspectRatio: 1 / 1.5,
          // physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          children: List.generate(
              allData.length,
              (index) => Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: clr[Random().nextInt(4)],
                        borderRadius: BorderRadius.circular(24)),
                    margin: EdgeInsets.all(6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "${allData[index].id}",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Text(
                          "${allData[index].title}",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Image.network(allData[index].thumbnail),
                      ],
                    ),
                    // height: 200,
                    // width: 80,
                  )),
        ));
  }
}
