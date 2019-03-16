import 'package:flutter/material.dart';
import 'package:iso_vis/isometric_vis.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Isometric DataVis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IsoPage(),
    );
  }
}

class IsoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Isometrics"),
        ),
        body: Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomPaint(painter: IsoVisPainter(), child: Container())));
  }
}
