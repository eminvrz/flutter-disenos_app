
// ARCHIVO YA NO UTILIZADO, REEMPLAZAMOS POR slideshow.dart donde hicimos optimizacion de este

// import 'package:disenos_app/src/models/slider_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';


// class SlideShowPage extends StatelessWidget {
//   const SlideShowPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => SliderModel(),
//       child: Scaffold(
//         body: Center(
//           child: Column(
//             children: <Widget>[
//                Expanded(
//                 child: _Slides()
//               ),
//               _Dots()
//             ],
//           )
//         ),
//       ),
//     );
//   }
// }

// class _Dots extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity, // todo el ancho posible
//       height: 70,
//       //color: Colors.red,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           _Dot(0),
//           _Dot(1),
//           _Dot(2),
//         ],
//       ),
//     );
//   }
// }

// class _Dot extends StatelessWidget {

//   final int index;

//     _Dot( this.index);

//   @override
//   Widget build(BuildContext context) {

//     final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 200),
//       width: 12,
//       height: 12,
//       margin: const EdgeInsets.symmetric(horizontal: 5),
//       decoration: BoxDecoration(
//         color: ( pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5) 
//                   ? Colors.blue : Colors.grey,
//         shape: BoxShape.circle
//       ),
//     );
//   }
// }

// class _Slides extends StatefulWidget {

//   @override
//   State<_Slides> createState() => _SlidesState();
// }

// class _SlidesState extends State<_Slides> {

//   final pageViewController = PageController();

//   @override
//   void initState() {
//     super.initState();
//     pageViewController.addListener(() { // Este para escuchar y que sepamos en que pagina estamos
//       print('Pagina actual: ${pageViewController.page}');

//       // Actualizar el provider, sliderModel
//       Provider.of<SliderModel>(context, listen: false).currentPage = pageViewController.page!;
//     });
//   }

//   @override
//   void dispose() {
//     pageViewController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return PageView(
//       controller: pageViewController,
//       children: <Widget>[
//         _Slide('assets/svgs/slide1.svg'),
//         _Slide('assets/svgs/slide2.svg'),
//         _Slide('assets/svgs/slide3.svg'),
//       ],
//     );
//   }
// }

// class _Slide extends StatelessWidget {

//   final String svg;

//   _Slide(this.svg);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       padding: const EdgeInsets.all(30),
//       child: SvgPicture.asset(svg),
//     );
//   }
// }
