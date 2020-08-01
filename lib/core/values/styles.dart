import 'package:flutter/material.dart';

dropShadow({colorWidget, topColor, bottomColor}){
  return BoxDecoration(
      shape: BoxShape.circle,
      color: colorWidget,
      boxShadow: [
        BoxShadow(
            color: topColor,
            offset: Offset(-1, -1),
            blurRadius: 4),
        BoxShadow(
            color: bottomColor,
            offset: Offset(3, 3),
            blurRadius: 10),
      ]);
}