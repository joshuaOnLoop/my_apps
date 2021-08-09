// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import './RandomWords.dart';
import './Layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // RandomWords();
    //final Widget widget = RandomWords();

    // Layout()
    final Widget widget = Layout();


    
    return MaterialApp(title: "My flutter app", home: widget);
  }
}
