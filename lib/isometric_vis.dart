import 'package:flutter/material.dart';
import 'isometric_calc.dart';
import 'dart:math';

class IsoVisPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Colors.white;
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);

    var center = Offset(size.width / 2, size.height / 2 + 5);

    paint.color = Colors.grey;

    canvas.drawCircle(center, 75.0, paint);

    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    paint.color = Colors.lightBlue;

    canvas.drawPath(
        Path()
          ..moveTo(100, 100)
          ..lineTo(200, 100)
          ..lineTo(200, 200)
          ..close(),
        paint);

    canvas.drawCircle(center, 75.0, paint);

    final linePath = Path()..moveTo(100, 100);

    for (int i = 0; i < 100; i++) {
      linePath.lineTo(100.0 + i * 4, 100 + 20 * cos(i / 4));
    }
    linePath.close();
    canvas.drawPath(linePath, paint);
  }

  void drawCube(Canvas canvas, Point3D minP, Point3D maxP) {}

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }
}
