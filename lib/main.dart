// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import './RandomWords.dart';
import './Layout.dart';
import './Fetch.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // RandomWords();
    //final Widget widget = RandomWords();

    // Layout()
    // final Widget widget = Layout();

    // Fetch()
    final Widget widget = Fetch();

    return MaterialApp(
      title: "My flutter app",
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => Home(),
        "/Fetch": (BuildContext context) => Fetch(),
        "/Layout": (BuildContext context) => Layout(),
        "/RandomWords": (BuildContext context) => RandomWords(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: [
            RaisedButton(
              child: Text("Fetch"),
              onPressed: () => Navigator.pushNamed(context, "/Fetch"),
            ),
            RaisedButton(
              child: Text("Layout"),
              onPressed: () => Navigator.pushNamed(context, "/Layout"),
            ),
            RaisedButton(
              child: Text("RandomWords"),
              onPressed: () => Navigator.pushNamed(context, "/RandomWords"),
            )
          ],
        ),
      ),
    );
  }
}
