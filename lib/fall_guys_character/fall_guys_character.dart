import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui' as ui;

///
/// The fall guys character is the first drawing made in flutter
/// The original design is inspired by @ux.carlos design: https://www.instagram.com/p/CEXl-5CjL5n/
///
/// (Note) the design is not optimized for mobiles with less than 1080 resolution

///
/// El personaje de fall guys es el primer dibujo hecho en flutter
/// El diseño original esta inspirado del diseño de @ux.carlos: https://www.instagram.com/p/CEXl-5CjL5n/
///
/// (Nota) el diseño no esta optimizado para moviles con una resolucion menor a 1080
///

class FallGuysCharacter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Text(
                'Flutter Canvas',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Text(
              'Fall Guys',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            AspectRatio(
              aspectRatio: 0.75,
              child: CustomPaint(
                size: Size.infinite,
                painter: CharacterCanvas(),
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '@alvardud',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.grey[600]),
                ),
                SizedBox(height: 8.0),
                Text(
                  '@ux.carlos',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.grey[600]),
                ),
              ],
            )),
          ],
        ));
  }
}

class CharacterCanvas extends CustomPainter {
  final Color guideColor = Color(0xff7D7D7D);
  final Color primaryColor = Color(0xff6C30C3);
  final Color midleShaderColor = Color(0xff7A41C6);
  final Color faceColor = Color(0xffFAFAFA);
  final Color armsColor = Color(0xff5C26B0);
  final Color handsColor = Color(0xff512598);
  final Color eyesColor = Color(0xff0E0E0E);
  final Color rebaseColor = Color(0xFFE0E0E0);

  @override
  void paint(Canvas canvas, Size size) {
    final Size center = Size(size.width / 2, size.height / 2);

    //********************************************************************
    //Paints configure
    //Configuracion del pintado

    //Skeleton
    //Esqueleto
    Paint skeleton = Paint()
      ..color = guideColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    Paint primaryPaint = Paint()..color = primaryColor.withOpacity(.9);

    Paint faceBottomPaint = Paint()..color = Color(0xffD7ACE7).withOpacity(.9);

    //body top
    //cuerpo superior
    Paint bodyTopPaint = Paint()
      ..color = primaryColor
      ..shader = ui.Gradient.linear(Offset(0.0, 30), Offset(200, 200), [
        primaryColor.withOpacity(.3),
        midleShaderColor.withOpacity(.8),
        primaryColor
      ], [
        0.3,
        0.7,
        1
      ]);

    //body middle
    //cuerpo medio
    Paint bodyMiddlePaint = Paint()
      ..color = primaryColor
      ..shader = ui.Gradient.linear(Offset(0.0, 0.0), Offset(250, 220), [
        primaryColor.withOpacity(.3),
        midleShaderColor.withOpacity(.8),
        primaryColor
      ], [
        0.33,
        0.66,
        1
      ]);

    //body bottom
    //cuerpo inferior
    Paint bodyBottomPaint = Paint()
      ..color = primaryColor
      ..shader = ui.Gradient.linear(Offset(0.0, 0.0), Offset(250, 220), [
        primaryColor.withOpacity(.3),
        midleShaderColor.withOpacity(.8),
        primaryColor
      ], [
        0.33,
        0.66,
        1
      ]);

    //face
    //rostro
    Paint face = Paint()..color = faceColor;

    //eyes
    //ojos
    Paint lefteyes = Paint()
      ..color = eyesColor
      ..shader = ui.Gradient.linear(
        Offset(165.0, 190.0),
        Offset(180, 200),
        [eyesColor.withOpacity(0.7), eyesColor],
      );

    Paint righteyes = Paint()
      ..color = eyesColor
      ..shader = ui.Gradient.linear(
        Offset(210.0, 190.0),
        Offset(225, 200),
        [eyesColor.withOpacity(0.7), eyesColor],
      );

    //arms
    //brazos
    Paint leftarmsPaint = Paint()
      ..color = primaryColor
      ..shader = ui.Gradient.linear(Offset(0.0, 0.0), Offset(220, 180), [
        primaryColor.withOpacity(.3),
        midleShaderColor.withOpacity(.8),
        primaryColor
      ], [
        0.33,
        0.66,
        1
      ]);

    Paint rightarmsPaint = Paint()
      ..color = armsColor
      ..shader = ui.Gradient.linear(
        Offset(260.0, 160.0),
        Offset(390, 200),
        [midleShaderColor.withOpacity(.8), armsColor],
      );

    //hands
    //manos
    Paint hands = Paint()..color = handsColor;

    //rebase
    //base
    Paint rebasePaint = Paint()..color = rebaseColor;

    //legs
    //piernas
    Paint leftlegs = Paint()
      ..color = primaryColor
      ..shader = ui.Gradient.linear(Offset(60.0, 120.0), Offset(280, 240), [
        primaryColor.withOpacity(.3),
        midleShaderColor.withOpacity(.8),
        primaryColor
      ], [
        0.33,
        0.66,
        1
      ]);

    Paint rightlegs = Paint()
      ..color = primaryColor
      ..shader = ui.Gradient.linear(Offset(210.0, 120.0), Offset(410, 240), [
        primaryColor.withOpacity(.3),
        midleShaderColor.withOpacity(.8),
        primaryColor
      ], [
        0.33,
        0.66,
        1
      ]);

    //foots
    //pies
    Paint leftfoots = Paint()
      ..color = primaryColor
      ..shader = ui.Gradient.linear(Offset(140.0, 160.0), Offset(270, 200),
          [Color(0xff9D73E1), midleShaderColor, primaryColor], [0.33, 0.66, 1]);

    Paint rightfoots = Paint()
      ..color = primaryColor
      ..shader = ui.Gradient.linear(Offset(260.0, 160.0), Offset(390, 200),
          [Color(0xff9D73E1), midleShaderColor, primaryColor], [0.33, 0.66, 1]);

    //*************************************************************************************************** */

    //Drawing at canvas
    //Dibujando en el canvas

    //rebase
    //base
    Path rebase = Path()
      ..addOval(Rect.fromLTWH(32, size.height - 60, size.width - 64, 50));
    canvas.drawPath(rebase, rebasePaint);

    //------------------------------------------------------------------------

    //legs
    //piernas
    canvas.drawRRect(
        RRect.fromLTRBAndCorners(center.width - 90, size.height - 140,
            center.width - 30, size.height - 40,
            topRight: Radius.circular(24.0),
            bottomRight: Radius.circular(24.0),
            bottomLeft: Radius.circular(24.0),
            topLeft: Radius.circular(24.0)),
        leftlegs);
    canvas.drawRRect(
        RRect.fromLTRBAndCorners(center.width + 30, size.height - 140,
            center.width + 90, size.height - 40,
            topRight: Radius.circular(24.0),
            bottomRight: Radius.circular(24.0),
            bottomLeft: Radius.circular(24.0),
            topLeft: Radius.circular(24.0)),
        rightlegs);

    //------------------------------------------------------------------------

    //foots
    //pies
    Path leftFoot = Path()
      ..addArc(
          Rect.fromLTRB(center.width - 105, size.height - 70, center.width - 15,
              size.height),
          -pi,
          pi)
      ..moveTo(center.width - 105, size.height - 35)
      ..quadraticBezierTo(center.width - 52.5, size.height - 20,
          center.width - 15, size.height - 35);

    Path rightFoot = Path()
      ..addArc(
          Rect.fromLTRB(center.width + 15, size.height - 70, center.width + 105,
              size.height),
          -pi,
          pi)
      ..moveTo(center.width + 15, size.height - 35)
      ..quadraticBezierTo(center.width + 52.5, size.height - 20,
          center.width + 105, size.height - 35);

    canvas.drawPath(rightFoot, rightfoots);
    canvas.drawPath(leftFoot, leftfoots);

    //------------------------------------------------------------------------

    //arms
    //brazos
    Path leftArm = Path()
      ..moveTo(74, 195)
      ..quadraticBezierTo(-10, 310, 40, 410)
      ..quadraticBezierTo(60, 440, 80, 410)
      ..quadraticBezierTo(79, 406, 80, 404)
      ..quadraticBezierTo(65, 380, 60, 340)
      ..quadraticBezierTo(58, 300, 62, 270)
      ..lineTo(70, 220)
      ..close();

    Path rightArm = Path()
      ..moveTo(size.width - 74, 195)
      ..quadraticBezierTo(size.width - 8, 310, size.width - 38, 410)
      ..quadraticBezierTo(size.width - 56, 440, size.width - 78, 410)
      ..quadraticBezierTo(size.width - 79, 406, size.width - 80, 404)
      ..quadraticBezierTo(size.width - 65, 380, size.width - 60, 340)
      ..quadraticBezierTo(size.width - 60, 300, size.width - 64, 274)
      ..lineTo(size.width - 70, 220)
      ..close();

    canvas.drawPath(leftArm, leftarmsPaint);
    canvas.drawPath(rightArm, rightarmsPaint);

    //------------------------------------------------------------------------

    //body
    //cuerpo
    Path bodyTop = Path()
      ..addArc(Rect.fromLTWH(79, 40.0, size.width - 160, 250), -pi, pi);

    Path bodyMiddle = Path()
      ..moveTo(79, 165)
      ..quadraticBezierTo(60, 250, 60, size.height - 180)
      ..lineTo(size.width - 60, size.height - 180)
      //..moveTo(size.width - 60, size.height - 180)
      ..quadraticBezierTo(size.width - 60, 250, size.width - 82, 145);

    Path bodyBottom = Path()
      ..moveTo(60, size.height - 180)
      ..quadraticBezierTo(center.width - 120, size.height - 100,
          center.width - 60, size.height - 100)
      ..lineTo(center.width + 60, size.height - 100)
      ..quadraticBezierTo(center.width + 120, size.height - 100,
          size.width - 60, size.height - 180);

    canvas.drawPath(bodyTop, bodyTopPaint);
    canvas.drawPath(bodyMiddle, bodyMiddlePaint);
    canvas.drawPath(bodyBottom, bodyBottomPaint);

    //------------------------------------------------------------------------

    //face
    //rostro
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(center.width - 80, 100, 160, 140),
            topLeft: Radius.circular(160),
            bottomLeft: Radius.circular(160),
            bottomRight: Radius.circular(160),
            topRight: Radius.circular(160)),
        face);

    //shadows in face
    //sombras en el rostro
    Path topShadow = Path()
      ..moveTo(center.width - 80, 170)
      ..quadraticBezierTo(center.width - 65, 85, center.width + 40, 105)
      ..quadraticBezierTo(center.width - 65, 75, center.width - 80, 160);

    Path bottomShadow = Path()
      ..moveTo(center.width - 30, 238)
      ..quadraticBezierTo(center.width + 65, 250, center.width + 80, 180)
      ..quadraticBezierTo(center.width + 65, 260, center.width - 30, 238);

    canvas.drawPath(topShadow, primaryPaint);
    canvas.drawPath(bottomShadow, faceBottomPaint);

    //------------------------------------------------------------------------

    //eyes
    //ojos
    canvas.drawRRect(
        RRect.fromRectAndCorners(Rect.fromLTWH(center.width - 30, 170, 15, 32),
            topRight: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0),
            topLeft: Radius.circular(8.0)),
        lefteyes);
    canvas.drawRRect(
        RRect.fromRectAndCorners(Rect.fromLTWH(center.width + 20, 170, 15, 32),
            topRight: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0),
            topLeft: Radius.circular(8.0)),
        righteyes);

    //------------------------------------------------------------------------

    //hands
    //manos
    Path leftHand = Path()
      ..moveTo(40, 365)
      ..quadraticBezierTo(38, 375, 44, 390)
      ..quadraticBezierTo(50, 395, 55, 388)
      ..quadraticBezierTo(60, 375, 50, 365)
      ..quadraticBezierTo(49, 362, 40, 365);

    Path rightHand = Path()
      ..moveTo(size.width - 40, 365)
      ..quadraticBezierTo(size.width - 38, 375, size.width - 44, 390)
      ..quadraticBezierTo(size.width - 50, 395, size.width - 55, 388)
      ..quadraticBezierTo(size.width - 60, 375, size.width - 50, 365)
      ..quadraticBezierTo(size.width - 49, 362, size.width - 40, 365);

    //shadows in hands
    //sombras en las manos
    Path leftHandshadow = Path()
      ..moveTo(42, 367)
      ..quadraticBezierTo(40, 377, 46, 392)
      ..quadraticBezierTo(52, 397, 57, 390)
      ..quadraticBezierTo(62, 377, 52, 367)
      ..quadraticBezierTo(51, 364, 42, 367);

    Path rightHandshadow = Path()
      ..moveTo(size.width - 38, 365)
      ..quadraticBezierTo(size.width - 36, 377, size.width - 42, 392)
      ..quadraticBezierTo(size.width - 48, 395, size.width - 53, 390)
      ..quadraticBezierTo(size.width - 58, 375, size.width - 48, 367)
      ..quadraticBezierTo(size.width - 47, 362, size.width - 38, 367);

    canvas.drawShadow(leftHandshadow, Color(0xff431983), .7, true);
    canvas.drawShadow(rightHandshadow, Color(0xff431983), .7, true);

    canvas.drawPath(leftHand, hands);
    canvas.drawPath(rightHand, hands);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
