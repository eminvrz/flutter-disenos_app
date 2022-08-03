import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBorderRedondeados extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70) 
        )
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    //Lapiz o paint que usaremos
    final paint = Paint();

    //Propiedades
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // stroke para los bordes y fill para cuando lo queremos rellenar
    paint.strokeWidth = 2; 

    final path = new Path();

    //Dibujar con el path y el lapiz o paint
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0,0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderTriangular extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    //Lapiz o paint que usaremos
    final paint = Paint();

    //Propiedades
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // stroke para los bordes y fill para cuando lo queremos rellenar
    paint.strokeWidth = 21; 

    final path = new Path();

    //Dibujar con el path y el lapiz o paint
    path.lineTo(size.width, size.height );
    path.lineTo(size.width, 0);
    // path.lineTo(0,0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderPico extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    //Lapiz o paint que usaremos
    final paint = Paint();

    //Propiedades
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // stroke para los bordes y fill para cuando lo queremos rellenar
    paint.strokeWidth = 21; 

    final path = new Path();

    //Dibujar con el path y el lapiz o paint
    path.lineTo(0, size.height * 0.20);
    path.lineTo(size.width * 0.5, size.height * 0.28 );
    path.lineTo(size.width, size.height * 0.20);
    path.lineTo(size.width, 0);
    // path.lineTo(0,0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderCurvo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    //Lapiz o paint que usaremos
    final paint = Paint();

    //Propiedades
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // stroke para los bordes y fill para cuando lo queremos rellenar
    paint.strokeWidth = 21; 

    final path = new Path();

    //Dibujar con el path y el lapiz o paint
    path.lineTo(0, size.height * 0.20);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.5, size.width, size.height * 0.20);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, size.height * 0.20);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderWave extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    //Lapiz o paint que usaremos
    final paint = Paint();

    //Propiedades
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // stroke para los bordes y fill para cuando lo queremos rellenar
    paint.strokeWidth = 21; 

    final path = new Path();

    //Dibujar con el path y el lapiz o paint
       path.moveTo(0, size.height * 0.75);
       path.quadraticBezierTo(size.width * 0.25, size.height - 60, size.width * 0.5, size.height - 230);
       path.quadraticBezierTo(size.width * 0.75, size.height * 0.6, size.width, size.height - 230);
       path.lineTo(size.width, size.height);
       path.lineTo(0, size.height);


      //Hacia arriba
      // path.lineTo(0, size.height * 0.25);
      // path.quadraticBezierTo(size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25);
      // path.quadraticBezierTo(size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
      // path.lineTo(size.width, 0);

    

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderWaveGradient extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter(),
      ),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect =  Rect.fromCircle(
      center: const Offset(150.0, 150.0), 
      radius: 180
      );

    const Gradient gradiente = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        // Si se agrega otro color, se tendra que agregar en stops
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA),
      ],
      stops: [
        0.2,
        0.5,
        1.0
      ]
      );


    //Lapiz o paint que usaremos
    final paint = Paint()..shader = gradiente.createShader(rect);

    //Propiedades
    paint.color = Colors.red;
    paint.style = PaintingStyle.fill; // stroke para los bordes y fill para cuando lo queremos rellenar
    paint.strokeWidth = 21; 

    final path = new Path();

    //Dibujar con el path y el lapiz o paint
      //  path.moveTo(0, size.height * 0.75);
      //  path.quadraticBezierTo(size.width * 0.25, size.height - 60, size.width * 0.5, size.height - 230);
      //  path.quadraticBezierTo(size.width * 0.75, size.height * 0.6, size.width, size.height - 230);
      //  path.lineTo(size.width, size.height);
      //  path.lineTo(0, size.height);


      //Hacia arriba
      path.lineTo(0, size.height * 0.25);
      path.quadraticBezierTo(size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25);
      path.quadraticBezierTo(size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
      path.lineTo(size.width, 0);

    

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


