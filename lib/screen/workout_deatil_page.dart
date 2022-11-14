import 'package:fitnessapp/model/fitnessModel.dart';
import 'package:flutter/material.dart';

class WorkoutDetailPage extends StatelessWidget {
  WorkoutDetailPage({Key? key, required this.fitnessModel}) : super(key: key);
  final FitnessModel fitnessModel;
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
          height: MediaQuery.of(context).size.height * 0.6,
          child: Image.network(
            "${fitnessModel.thumbnail}",
            fit: BoxFit.cover,
          )),
    );
  }
}
