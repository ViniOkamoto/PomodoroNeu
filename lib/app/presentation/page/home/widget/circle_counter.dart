import 'dart:math';

import 'package:flutter/material.dart';

class CircleCounter extends CustomPainter {
  CircleCounter({
    @required this.animation,
    @required this.backgroundColor,
    @required this.color,
  }) : super(repaint: animation);

  /// Animation representing what we are painting
  final Animation<double> animation;

  /// The color in the background of the circle
  final Color backgroundColor;

  /// The foreground color used to indicate progress
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = backgroundColor
      ..strokeWidth = 13.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * pi;
    canvas.drawArc(Offset.zero & size, pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CircleCounter other) {
    return animation.value != other.animation.value ||
        color != other.color ||
        backgroundColor != other.backgroundColor;
  }
}
