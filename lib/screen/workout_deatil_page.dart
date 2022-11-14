import 'package:fitnessapp/model/fitnessModel.dart';
import 'package:fitnessapp/screen/workout_timer_page.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class WorkoutDetailPage extends StatefulWidget {
  WorkoutDetailPage({Key? key, required this.fitnessModel}) : super(key: key);
  final FitnessModel fitnessModel;

  @override
  State<WorkoutDetailPage> createState() => _WorkoutDetailPageState();
}

class _WorkoutDetailPageState extends State<WorkoutDetailPage> {
  int second = 3;
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
      body: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Image.network(
                "${widget.fitnessModel.thumbnail}",
                fit: BoxFit.cover,
              )),
          Expanded(
            child: SleekCircularSlider(
              appearance: CircularSliderAppearance(),
              min: 3,
              max: 30,
              initialValue: second.toDouble(),
              onChange: (double value) {
                setState(() {
                  second = value.toInt();
                });
                // callback providing a value while its being changed (with a pan gesture)
              },
              innerWidget: (double value) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "$second",
                      style: TextStyle(fontSize: 18, color: Colors.purple),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WorkoutTimerPage(
                                      second: second,
                                      fitnessModel: widget.fitnessModel,
                                    )));
                      },
                      child: Text("START"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.pinkAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                    )
                  ],
                );
                // use your custom widget inside the slider (gets a slider value from the callback)
              },
            ),
          )
        ],
      ),
    );
  }
}
