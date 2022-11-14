import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  String link = "";

  @override
  Widget build(BuildContext context) {
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
              12,
              (index) => Container(
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(24)),
                    margin: EdgeInsets.all(6),
                    // height: 200,
                    // width: 80,
                  )),
        ));
  }
}
