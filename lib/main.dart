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
      debugShowCheckedModeBanner: false,
    );
  }
}

class IsoPage extends StatefulWidget {
  @override
  _IsoPageState createState() => _IsoPageState();
}

class _IsoPageState extends State<IsoPage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  bool playing = true;
  double scale = 1.0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Isometrics"),
      ),
      body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Stack(
            children: <Widget>[
              AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return CustomPaint(
                        painter: IsoVisPainter(controller.value, scale),
                        child: Container());
                  }),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Slider(
                  value: scale,
                  min: 1.0,
                  max: 10.0,
                  onChanged: (s) => setState(() => scale = s),
                ),
              )
            ],
          )),
      floatingActionButton: playing
          ? FloatingActionButton(
              onPressed: () {
                setState(() => this.playing = false);
                controller.stop();
              },
              child: Icon(Icons.pause),
            )
          : FloatingActionButton(
              onPressed: () {
                setState(() => this.playing = true);
                controller.repeat();
              },
              child: Icon(Icons.play_arrow),
            ),
    );
  }
}
