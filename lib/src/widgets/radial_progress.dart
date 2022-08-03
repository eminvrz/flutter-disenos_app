import 'dart:math';

import 'package:flutter/material.dart';


class RadialProgress extends StatefulWidget {

  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;


   const RadialProgress({super.key, 
    required this.porcentaje, 
    required this.colorPrimario, 
    required this.colorSecundario, 
    required this.grosorSecundario, 
    required this.grosorPrimario
    });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late double porcentajeAnterior;

  @override
  void initState() {

    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));


    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller, 
      builder: (BuildContext context, Widget ? child ){
        return Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
        painter: _MiRadialProgress( 
          (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value),
          widget.colorPrimario,
          widget.colorSecundario,
          widget.grosorSecundario,
          widget.grosorPrimario
         ),
        ),
      );
      }
    );

    
  }
}

class _MiRadialProgress extends CustomPainter{

    final porcentaje;
    final Color colorPrimario;
    final Color colorSecundario;
    final double grosorSecundario;
    final double grosorPrimario;

  _MiRadialProgress( 
    this.porcentaje,
    this.colorPrimario,
    this.colorSecundario, 
    this.grosorSecundario, 
    this.grosorPrimario
    );

  @override
  void paint(Canvas canvas, Size size) {

     final Rect rect = Rect.fromCircle(
      center: const Offset(3,4), 
      radius: 300
      );

    const Gradient gradiente = LinearGradient(
      colors: <Color>[
        Color(0xffC012FF),
        Color(0xff6D05E8)
      ]);


    // Circulo completado
    final paint = Paint()
    ..strokeWidth = grosorSecundario
    ..color       = colorSecundario
    ..style       = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height / 2);
    final radio  = min( size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    // Arco
    final paintArco = Paint()
    ..strokeWidth = grosorPrimario
    // ..color       = colorPrimario
    ..shader      = gradiente.createShader(rect)
    ..strokeCap   = StrokeCap.round
    ..style       = PaintingStyle.stroke;

    // Parte que se llevara ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(
    Rect.fromCircle(center: center, radius: radio), 
    -pi / 2, 
    arcAngle, 
    false, 
    paintArco
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;


}
