import 'dart:math';

class Point2D {
  double x, y;
  Point2D(this.x, this.y);
}

class Point3D {
  double x, y, z;
  Point3D(this.x, this.y, this.z);

  Point2D intoIso2D(double height) {
    final w = (height * sqrt(3.0)) / 2;

    return Point2D(-w * (z - x), -height * (x / 2 + y + z / 2));
  }
}
