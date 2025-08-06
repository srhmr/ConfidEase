import 'dart:math';
import 'package:flutter/material.dart';

Path createHexagonPath(Size size) {
  const int sides = 6;
  final double minDimension = size.width < size.height ? size.width : size.height;
  final double radius = minDimension / 2; // sakto kahit rectangular
  final Offset center = Offset(size.width / 2, size.height / 2);

  final path = Path();
  var angle = (pi * 2) / sides;

  Offset firstPoint = Offset(
    radius * cos(-pi / 2), // start sa taas para upright
    radius * sin(-pi / 2),
  );
  path.moveTo(firstPoint.dx + center.dx, firstPoint.dy + center.dy);

  for (int i = 1; i <= sides; i++) {
    double x = radius * cos(angle * i - pi / 2) + center.dx;
    double y = radius * sin(angle * i - pi / 2) + center.dy;
    path.lineTo(x, y);
  }

  path.close();
  return path;
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return createHexagonPath(size);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class HexagonBorder extends StatelessWidget {
  final double width;
  final double height;
  final Color fillColor;
  final Color borderColor;
  final double borderWidth;

  const HexagonBorder({
    super.key,
    required this.width,
    required this.height,
    required this.fillColor,
    this.borderColor = const Color(0xFF000000),
    this.borderWidth = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: _HexagonBorderPainter(
        fillColor: fillColor,
        borderColor: borderColor,
        borderWidth: borderWidth,
      ),
    );
  }
}

class _HexagonBorderPainter extends CustomPainter {
  final Color fillColor;
  final Color borderColor;
  final double borderWidth;

  _HexagonBorderPainter({
    required this.fillColor,
    required this.borderColor,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = createHexagonPath(size);

    // Fill
    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, fillPaint);

    // Border
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

