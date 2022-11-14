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
    try {
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
        setState(() {
          allData.add(fitnessModel);
        });
      }
    } catch (e) {
      print(e);
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
      Color(0xffB54FAA),
      Color(0xff939BF9),
      Color(0xff3ED09B),
      Color(0xffF5B741),
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
                        image: DecorationImage(
                            image: NetworkImage("${allData[index].thumbnail}"),
                            fit: BoxFit.cover),
                        color: clr[Random().nextInt(4)],
                        borderRadius: BorderRadius.circular(24)),
                    margin: EdgeInsets.all(6),
                    child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color(0xffB54FAA),
                            Color(0xff939BF9),
                            Color(0xff3ED09B),
                            Color(0xffF5B741),
                          ]),
                        ),
                      ),
                      Text(
                        "${allData[index].title}",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ]),
                    // child: Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     Text(
                    //       "${allData[index].id}",
                    //       style: TextStyle(
                    //           fontSize: 20,
                    //           color: Colors.black,
                    //           fontWeight: FontWeight.w600),
                    //     ),
                    //     Text(
                    //       "${allData[index].title}",
                    //       style: TextStyle(
                    //           fontSize: 24,
                    //           color: Colors.black,
                    //           fontWeight: FontWeight.w400),
                    //     ),
                    //     Container(
                    //         // padding: EdgeInsets.all(4),
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(16)),
                    //         child: Image.network(
                    //           allData[index].thumbnail,
                    //           // fit: BoxFit.cover,
                    //         )),
                    //   ],
                    // ),
                    // height: 200,
                    // width: 80,
                  )),
        ));
  }
}
