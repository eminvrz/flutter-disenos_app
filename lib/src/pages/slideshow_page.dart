import 'package:disenos_app/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: MiSlideshow()),
          Expanded(child: MiSlideshow()),
        ],
      )
    );
  }
}

// ignore: use_key_in_widget_constructors
class MiSlideshow extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      bulletPrimario: 18,
      bulletSecundario: 12,
      // posicionPuntos: true,
      colorPrimario: Colors.red,
      // colorSecundario: Colors.purple,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide1.svg'),
        SvgPicture.asset('assets/svgs/slide2.svg'),
        SvgPicture.asset('assets/svgs/slide3.svg'),
        SvgPicture.asset('assets/svgs/slide4.svg'),
        SvgPicture.asset('assets/svgs/slide5.svg'),
      ],
    );
  }
}
