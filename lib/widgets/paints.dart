import 'package:flutter/material.dart';

class BezierClipper extends CustomClipper<RRect> {
  @override
  RRect getClip(Size size) {
    final rect = RRect.fromLTRBR(0, size.height - 100, size.width, size.height, Radius.circular(16.0));

    // Define your quadratic Bézier curve here.
    final controlPoint = Offset(0, size.height * .7);
    final endPoint = Offset(size.width, size.height - 100);

    final path = Path()
      ..addRRect(rect)
      ..quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    return RRect.fromRectAndCorners(
      path.getBounds(),
      // bottomLeft: Radius.circular(16.0),
      // bottomRight: Radius.circular(16.0),
    );
  }


  @override
  bool shouldReclip(CustomClipper<RRect> oldClipper) {
    return true;
  }
}

class AppBarBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width, height = 160;

    Paint paint1 = Paint();
    Path path1 = Path();
    paint1.strokeWidth = 33;
    paint1.style = PaintingStyle.fill;
    paint1.color = const Color.fromRGBO(16, 27, 44, 1);
    paint1.color = Colors.red;

    Paint paint2 = Paint();
    Path path2 = Path();
    paint2.color = const Color.fromRGBO(22, 37, 51, 1);

    Paint paint3 = Paint();
    Path path3 = Path();
    // paint3.color = const Color.fromRGBO(250, 250, 250, 1);
    // paint3.color = const Color.fromRGBO(22, 37, 51, 1);
    paint3.color = const Color.fromRGBO(16, 27, 44, 1);
    // paint3.color = Colors.blueGrey.shade700;
    //
    path2.moveTo(width * .68, 0);
    path2.lineTo(width, 0);
    path2.lineTo(width, height);
    path2.lineTo(0, height);
    path2.lineTo(0, height * .75);
    path2.quadraticBezierTo(width * .7, height * .7, width * .68, 0);
    // canvas.drawPath(path2, paint2);
    
    path3.lineTo(0, height * 1.2);
    path3.quadraticBezierTo(width * .25, height * 2.2, width, height * 1.05);
    path3.lineTo(width, 0);
    canvas.drawPath(path3, paint3);

    // path1.moveTo(width * .4, height * .3);
    // path1.lineTo(width * .2, height * .8);
    // path1.lineTo(width * .2 + 20, height * .8);
    // path1.lineTo(width * .2 + 20, height * .3);

    path1.moveTo(50, 50);
    path1.lineTo(20, 100);
    // path1.lineTo(20 + 10, 100);
    // path1.lineTo(20 + 10, 50);
    // path1.lineTo(0, 0);
    // path1.lineTo(0, 180);
    // path1.lineTo(123, 180);
    // path1.lineTo(123, 0);
    // path1.lineTo(width * .2, height * .8);
    // path1.lineTo(width, height);
    // path1.lineTo(width * .5, height);
    // path1.quadraticBezierTo(width * .9, height * .7, width * .88, 0);
    canvas.drawPath(path1, paint1);

    final paint = Paint()
      ..color = const Color(0xFF454E5B).withOpacity(.3)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 20.0;

    Offset startPoint = Offset(width * .4, height * .7);
    Offset endPoint = Offset(width * .2, height * 1.5);
    canvas.drawLine(startPoint, endPoint, paint);

    startPoint = Offset(width * .4 + 80, height * .7 - 20);
    endPoint = Offset(width * .2 + 80, height * 1.5 - 20);
    canvas.drawLine(startPoint, endPoint, paint);

    startPoint = Offset(width * .4 + 80 * 2, height * .7 - 20 * 2);
    endPoint = Offset(width * .2 + 80 * 2, height * 1.5 - 20 * 2);
    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class PageViewIndicatorEllipse extends CustomPainter {
  PageViewIndicatorEllipse({
    required this.length,
    required this.activeIndex,
    required this.activeColor,
    required this.inactiveColor,
  });
  final int length;
  final int activeIndex;
  final Color activeColor;
  final Color inactiveColor;

  @override
  void paint(Canvas canvas, Size size) {
    const double spacing = 10.0;
    const double dimension = 10.0;
    final double dy = size.height - 15.0;
    final double width = dimension * length + spacing * (length - 1);
    final double startPoint = size.width/2 - width/2;

    for (int i = 0; i < length; i++) {
      final Paint paint = Paint();
      final Path path = Path();
      final double dx = i * (dimension + spacing) + startPoint;
      final Offset center = Offset(dx, dy);
      final Rect rect = Rect.fromCenter(center: center, width: dimension, height: dimension);
      paint.color = i == activeIndex ? activeColor : inactiveColor;
      path.addOval(rect);
      canvas.drawPath(path, paint);
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ButtonTrianglePaint extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final path  = Path();
    final paint = Paint()
      ..color = const Color(0xFF454E5B);

    path.moveTo(size.width - 22, 0);
    path.lineTo(size.width, 22);
    path.lineTo(size.width, 5);
    path.quadraticBezierTo(size.width, 0, size.width - 5, 0);

    canvas.drawPath(path, paint);
    }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}