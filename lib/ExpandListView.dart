import 'package:flutter/material.dart';

class ExpandListView extends StatelessWidget {
  final texts = List<String>.filled(12, 'Im a filler text');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text("Expanded List View"),
          backgroundColor: Colors.grey,
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.blue],
              ),
            ),
            child: SingleChildScrollView(
                // physics: ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color: Colors.yellow,
                      child: Text("Im a filler container"),
                    ),
                    Container(
                      color: Colors.yellow,
                      child: Text("Im a filler container"),
                    ),
                    Container(
                      color: Colors.yellow,
                      child: Text("Im a filler container"),
                    ),

                    // ColleagueListView
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                        color: Colors.grey,
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Column(
                          children: [
                            ...texts.map<Widget>((text) => _card(text)).toList()
                          ],
                        ))
                  ],
                ))));
  }

  Widget _card(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25.0),
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            )),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
