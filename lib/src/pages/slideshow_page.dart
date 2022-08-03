import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SlideShowPage extends StatelessWidget {
  const SlideShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _Slides()
      ),
    );
  }
}


class _Slides extends StatelessWidget {
  const _Slides({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        children: <Widget>[
          _Slide('assets/svgs/slide1.svg'),
          _Slide('assets/svgs/slide2.svg'),
          _Slide('assets/svgs/slide3.svg'),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String svg;

  _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(svg),
    );
  }
}
