import 'package:flutter/material.dart';


class CuadradoAnimadoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _CuadradoAnimado()
      )
   );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado> with SingleTickerProviderStateMixin {

 late AnimationController controller;

 // Animaciones
 late Animation<double> moverderecha;

 late Animation<double> moverarriba;

 late Animation<double> moverizquierda;

 late Animation<double> moverabajo;



 @override
  void initState() {

    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 4500));

    moverderecha = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0, 0.25, curve: Curves.bounceOut)));

    moverarriba = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.25, 0.50, curve: Curves.bounceOut)));

    moverizquierda = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.50, 0.75, curve: Curves.bounceOut)));

    moverabajo = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.75, 1, curve: Curves.bounceOut)));

    controller.addListener(() {
      if( controller.status == AnimationStatus.completed){
        print('completado');
        controller.reset();
      }
     });

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    // Play o Reproduccion
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget ? child) {
        return Transform.translate(
          offset: Offset(moverderecha.value + moverizquierda.value, moverarriba.value + moverabajo.value),
          child: child,
        );
      },
    );
  }
}





class _Rectangulo extends StatelessWidget {
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
