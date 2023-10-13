// ignore: library_prefixes
import 'dart:math' as Math;

import 'package:flutter/material.dart';
class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({super.key});


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CuadradoAnimado() 
      )
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({super.key});
  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}
 // Se usa para animaciones
class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin{

  // Es el controlador, que va a permitir que avanze, retrocesa, regrese etc...
  late AnimationController controller; 
  // Es el que controla los valores que van a iniciar la animacion
  late Animation<double> rotacion;

  late Animation<double> opacidad;
  late Animation<double> opacidadOut;

  late Animation<double> moverderecha;

  late Animation<double> agrandar;

  @override
  void initState() {
    // TODO: implement initState

    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 4000));

    rotacion = Tween(begin: 0.0, end: 2.0 * Math.pi).animate( 
      CurvedAnimation(parent: controller, curve: Curves.easeOut));

    opacidad = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0, 0.25, curve: Curves.easeOut)));

    opacidadOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.75, 1.0, curve: Curves.easeOut)));

    moverderecha = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut));

    
    agrandar = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut));
  

    controller.addListener(() {
      
      // ignore: avoid_print
      print('status ${controller.status}');

      if( controller.status == AnimationStatus.completed) {
        // controller.repeat();
        // controller.reverse();
        controller.reset();
      } 

    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    // Play o Reproduccion
    controller.forward();

    return AnimatedBuilder(
      animation: controller, 
      child: const _Rectangulo(),
      builder: ( BuildContext context, Widget ? childRectangulo){

      // print('Opacidad ${opacidad.value}');
      // print('Rotacion ${rotacion.value}');

        return Transform.translate(
          offset: Offset( moverderecha.value, 0),
          child: Transform.rotate(
            angle: rotacion.value,
            child: Opacity(
                opacity: opacidad.value - opacidadOut.value,
                child: Transform.scale(
                  scale: agrandar.value,
                  child: childRectangulo),
              ),
            ),
        );
      }
    );
  }
}




class _Rectangulo extends StatelessWidget {
  const _Rectangulo();

    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: const BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}

