import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ConcaveDecoration extends Decoration {
  final ShapeBorder shape;
  final double depth;
  final List<Color> colors;
  final  double opacityTop;
  final double opacityBottom;
  ConcaveDecoration({
    @required this.shape,
    @required this.depth,
    this.colors = const [Colors.black87, Colors.white],
    this.opacityTop = 1.0,
    this.opacityBottom = 1.0,
  }) : assert(shape != null), assert(colors == null || colors.length == 2);

  @override
  BoxPainter createBoxPainter([onChanged]) => _ConcaveDecorationPainter(shape, depth, colors, opacityTop, opacityBottom);

  @override
  EdgeInsetsGeometry get padding => shape.dimensions;

  @override
  Decoration lerpFrom(Decoration a, double t) {
    if (a is ConcaveDecoration) {
      t = Curves.easeInOut.transform(t);
      return ConcaveDecoration(
        shape: ShapeBorder.lerp(a.shape, shape, t),
        depth: ui.lerpDouble(a.depth, depth, t),
        colors: [
          Color.lerp(a.colors[0], colors[0], t),
          Color.lerp(a.colors[1], colors[1], t),
        ],
        opacityTop: ui.lerpDouble(a.opacityTop, opacityTop, t),
        opacityBottom: ui.lerpDouble(a.opacityBottom, opacityBottom, t),
      );
    }
    return null;
  }
}

class _ConcaveDecorationPainter extends BoxPainter {
  ShapeBorder shape;
  double depth;
  List<Color> colors;
  double opacityTop;
  double opacityBottom;

  _ConcaveDecorationPainter(this.shape, this.depth, this.colors, this.opacityTop, this.opacityBottom) {
    if (depth > 0) {
      colors = [
        colors[1],
        colors[0],
      ];
    } else {
      depth = -depth;
    }
    colors = [
      colors[0].withOpacity(opacityTop),
      colors[1].withOpacity(opacityBottom),
    ];
  }

  @override
  void paint(ui.Canvas canvas, ui.Offset offset, ImageConfiguration configuration) {
    final shapePath = shape.getOuterPath(offset & configuration.size);
    final rect = shapePath.getBounds();

    final delta = 16 / rect.longestSide;
    final stops = [0.5 - delta, 0.5 + delta];

    final path = Path()
      ..fillType = PathFillType.evenOdd
      ..addRect(rect.inflate(depth * 2))
      ..addPath(shapePath, Offset.zero);
    canvas.save();
    canvas.clipPath(shapePath);

    final paint = Paint()..maskFilter = MaskFilter.blur(BlurStyle.normal, depth);
    final clipSize = rect.size.aspectRatio > 1? Size(rect.width, rect.height / 2) : Size(rect.width / 2, rect.height);
    for (final alignment in [Alignment.topLeft, Alignment.bottomRight]) {
      final shaderRect = alignment.inscribe(Size.square(rect.longestSide), rect);
      paint..shader = ui.Gradient.linear(shaderRect.topLeft, shaderRect.bottomRight, colors, stops);

      canvas.save();
      canvas.clipRect(alignment.inscribe(clipSize, rect));
      canvas.drawPath(path, paint);
      canvas.restore();
    }
    canvas.restore();
  }
}