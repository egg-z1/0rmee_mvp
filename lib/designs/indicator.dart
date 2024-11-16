import 'package:flutter/material.dart';

class CustomLabelIndicator extends Decoration {
  final Color color;
  final BorderRadius borderRadius;

  CustomLabelIndicator({required this.color, required this.borderRadius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomLabelIndicatorPainter(color, borderRadius);
  }
}

class _CustomLabelIndicatorPainter extends BoxPainter {
  final Color color;
  final BorderRadius borderRadius;

  _CustomLabelIndicatorPainter(this.color, this.borderRadius);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect tabBounds = Offset(
          offset.dx, // -16 제거
          configuration.size!.height - 2,
        ) &
        Size(130, 2);

    final RRect rrect = RRect.fromRectAndCorners(
      tabBounds,
      topLeft: borderRadius.topLeft,
      topRight: borderRadius.topRight,
      bottomLeft: borderRadius.bottomLeft,
      bottomRight: borderRadius.bottomRight,
    );

    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawRRect(rrect, paint);
  }
}
