
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pomodoroapp/core/values/colors.dart';

class CircleCounter extends CustomPainter{
  CircleCounter();
  @override
  void paint(Canvas canvas, Size size){
    Paint outerCircle = Paint()
      ..strokeWidth = 14
      ..color = orangeColor
      ..style = PaintingStyle.stroke;


    Paint completeArc = Paint()
    ..strokeWidth = 1
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width/2, size.height/2);
    double radius = min(size.width/2, size.height/2) - 7;
    
    canvas.drawCircle(center, radius, outerCircle);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}