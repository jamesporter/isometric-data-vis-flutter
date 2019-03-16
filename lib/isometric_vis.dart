import 'package:flutter/material.dart';
import 'isometric_calc.dart';
import 'dart:math';

class IsoVisPainter extends CustomPainter {
  double dt;

  IsoVisPainter(this.dt);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final bgPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..color = Colors.white;

    for (int j = 9; j >= 0; j--) {
      final linePath = Path();

      paint.color = Color.fromARGB(255, 41, 204 - j * 12, 130 + j * 4);

      for (int i = 0; i < 25; i++) {
        final xy = Point3D(
                i.toDouble() * 4,
                (2 + 18 * dt) * cos(31.4 * dt + i / (2 + j / 5)),
                j.toDouble() * 10.0)
            .intoIso2D(2)
            .offsetted(size.width / 2, size.height * 0.5 + 100);

        if (i == 0) {
          linePath.moveTo(xy.x, xy.y);
        } else {
          linePath.lineTo(xy.x, xy.y);
        }
      }

      canvas.drawPath(linePath, bgPaint);
      canvas.drawPath(linePath, paint);
    }
  }

  @override
  bool shouldRepaint(IsoVisPainter oldDelegate) {
    return true;
  }
}
