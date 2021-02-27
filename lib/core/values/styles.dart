import 'package:flutter/material.dart';
import 'package:pomodoroapp/app/presentation/widget/concave_decoration.dart';

mainDropShadow({colorWidget, topColor, bottomColor}) {
  return BoxDecoration(
    shape: BoxShape.circle,
    color: colorWidget,
    boxShadow: [
      BoxShadow(color: topColor, offset: Offset(-1, -1), blurRadius: 5),
      BoxShadow(color: bottomColor, offset: Offset(3, 3), blurRadius: 10),
    ],
  );
}

secondaryDropShadow(
    {@required colorWidget,
    @required topColor,
    @required bottomColor,
    shape,
    borderRadius = null}) {
  return BoxDecoration(
      shape: shape,
      color: colorWidget,
      borderRadius: borderRadius,
      boxShadow: [
        BoxShadow(color: topColor, offset: Offset(-1, -1), blurRadius: 2),
        BoxShadow(color: bottomColor, offset: Offset(2, 2), blurRadius: 10),
      ]);
}

tertiaryDropShadow(
    {@required colorWidget,
    @required topColor,
    @required bottomColor,
    shape,
    borderRadius = null}) {
  return BoxDecoration(
      shape: shape,
      color: colorWidget,
      borderRadius: borderRadius,
      boxShadow: [
        BoxShadow(color: topColor, offset: Offset(-2, -1), blurRadius: 2),
        BoxShadow(color: bottomColor, offset: Offset(3, 2), blurRadius: 4),
      ]);
}

primaryInnerShadow({topColor, bottomColor, double radius = 50}) {
  return ConcaveDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      colors: [bottomColor, topColor],
      depth: 4,
      opacityTop: 0.3,
      opacityBottom: 0.8);
}

circleInnerShadow({topColor, bottomColor, depth = 4.0}) {
  return ConcaveDecoration(
      shape: CircleBorder(),
      colors: [bottomColor, topColor],
      depth: depth,
      opacityTop: 0.3,
      opacityBottom: 0.8);
}

secundaryInnerShadow({topColor, bottomColor, radius}) {
  return ConcaveDecoration(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
    ),
    colors: [bottomColor, topColor],
    depth: 7.0,
    opacityTop: 0.3,
    opacityBottom: 0.3,
  );
}
