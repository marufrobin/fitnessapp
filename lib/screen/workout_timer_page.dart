import 'dart:async';

import 'package:fitnessapp/model/fitnessModel.dart';
import 'package:flutter/material.dart';

class WorkoutTimerPage extends StatefulWidget {
  WorkoutTimerPage({Key? key, required this.second, required this.fitnessModel})
      : super(key: key);
  int second;
  FitnessModel fitnessModel;

  @override
  State<WorkoutTimerPage> createState() => _WorkoutTimerPageState();
}

class _WorkoutTimerPageState extends State<WorkoutTimerPage> {
  late Timer timer;
  int startCount = 0;
  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.tick == widget.second) {
        timer.cancel();
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pop(context);
        });
      }
      setState(() {
        startCount = timer.tick;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              "${widget.fitnessModel.gif}",
            ),
            Text(
              "${startCount}",
              style: TextStyle(fontSize: 26, color: Colors.purple),
            )
          ],
        ),
      ),
    );
  }
}
