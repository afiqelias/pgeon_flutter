import 'package:flutter/material.dart';

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(
        size.width / 4, 270, size.width / 2, size.height - 100);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height - 70,
        size.width, size.height - 100);
    //path.lineTo(size.width, size.height-100);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
