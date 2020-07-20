
import 'package:flutter/material.dart';

dropShadow({colorWidget, whiteShadowColor, blackShadowColor}){
  return BoxDecoration(
      shape: BoxShape.circle,
      color: colorWidget,
      boxShadow: [
        BoxShadow(
            color: whiteShadowColor,
            offset: Offset(-1, -1),
            blurRadius: 4),
        BoxShadow(
            color: blackShadowColor,
            offset: Offset(1, 1),
            blurRadius: 4),
      ]);
}