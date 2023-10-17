// ignore_for_file: avoid_print

import 'package:disenos_app/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestPage extends StatelessWidget {

  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {

  final widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          PinterestGrid(),
          _PinterestMenuLocation(),
        ],
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
  final widthScreen = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: 30,
      child: SizedBox(
        width: widthScreen,
        child: Align(
          child: PinterestMenu(),
        ),
      )
    );
  }
}
 
 // Stateful para usar el Listener y saber cuando el usuario desplazara hacia abajo para desaparecer el menu 
class PinterestGrid extends StatefulWidget {

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {

  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = ScrollController();
  double scrollAnterior = 0;
  @override
  void initState() {

    controller.addListener(() {
      //print(' ScrollListener ${controller.offset}'); // offset para que nos muestre los puntos que vamos desplazando
      if ( controller.offset >scrollAnterior ){
        print('Ocultar Menu');
      } else {
        print('Mostrar Menu');
      }
      scrollAnterior = controller.offset;
    });
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: 2,
        pattern: [
          const WovenGridTile(1),
          const WovenGridTile(
            5 / 7,
            crossAxisRatio: 0.9,
            alignment: AlignmentDirectional.centerEnd,
          ),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => _PinterestItem(index: index),
          childCount: items.length),
    );
  }
}
 
class _PinterestItem extends StatelessWidget {
  final int index;
  const _PinterestItem({
    Key? key,
    required this.index,
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}
