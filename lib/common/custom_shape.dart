import 'package:flutter/material.dart';
import 'package:url_shortener/common/color_codes.dart';

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint0 = Paint()
      ..color = lightPurple
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(size.width*0.9900000,size.height*0.0100000);
    path0.quadraticBezierTo(size.width*0.2335500,size.height*-0.0197000,0,0);
    path0.cubicTo(size.width*0.0079500,size.height*1.0962000,size.width*0.6667000,size.height*0.3272000,size.width,size.height*0.8905000);
    path0.quadraticBezierTo(size.width*0.9975000,size.height*0.6703750,size.width*0.9900000,size.height*0.0100000);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
