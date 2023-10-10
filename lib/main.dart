import 'package:disenos_app/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';
// import 'package:disenos_app/src/pages/graficas_circulares_page.dart';
// import 'package:disenos_app/src/retos/cuadrado_animado.dart';
// import 'package:disenos_app/src/pages/animaciones_pages.dart';
// import 'package:disenos_app/src/pages/headers_pages.dart';

  void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Diseños App',
    home: SlideshowPage()
    );
  }
}
