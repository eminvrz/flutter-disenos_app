
// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class Slideshow extends StatelessWidget {

  final List<Widget> slides;
  final bool posicionPuntos;
  final Color colorPrimario;
  final Color colorSecundario;
  final int bulletPrimario;
  final int bulletSecundario;


   // ignore: use_key_in_widget_constructors
   const Slideshow({
    required this.slides, 
    this.posicionPuntos = false, 
    this.colorPrimario = Colors.blue, 
    this.colorSecundario = Colors.grey, 
    this.bulletPrimario = 12, 
    this.bulletSecundario = 12
  });
  

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel( colorPrimario, colorSecundario, bulletPrimario, bulletSecundario),
      child: SafeArea( // Para que no choquen los dots en la orilla de la pantalla
        child: Center(
            child: Column(
              children: <Widget>[
                if (posicionPuntos) 
                  _Dots(slides.length),
                 Expanded(
                  child: _Slides( slides)
                ),
                if (!posicionPuntos) 
                  _Dots(slides.length),
              ],
            )
          ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {

  final int totalSlides;

  // ignore: prefer_const_constructors_in_immutables
  _Dots(
    this.totalSlides, 
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // todo el ancho posible
      height: 70,
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate( totalSlides, (i) => _Dot(i)),
        // children: <Widget>[
        //   _Dot(0),
        //   _Dot(1),
        //   _Dot(2),
        // ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;

    const _Dot( 
      this.index, 
    );

  @override
  Widget build(BuildContext context) {

    final ssModel = Provider.of<_SlideshowModel>(context);
    int tamano;
    Color color;

    if( ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5) {
      tamano = ssModel.bulletPrimario;
      color  = ssModel.colorPrimario;
    } else {
      tamano = ssModel.bulletSecundario;
      color  = ssModel.colorSecundario;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      // Todo: Tarea
      width: tamano.toDouble(),
      height: tamano.toDouble(),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {

  final List<Widget> slides;

   _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() { // Este para escuchar y que sepamos en que pagina estamos

      // Actualizar el provider, sliderModel
      Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

      
    return PageView(
      controller: pageViewController,
      children: widget.slides.map( (slide) => _Slide( slide ) ).toList() ,
    );
  }
}

class _Slide extends StatelessWidget {

  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SlideshowModel with ChangeNotifier{

  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  int _bulletPrimario = 12;
  int _bulletSecundario = 12;

  _SlideshowModel(
    this._colorPrimario, 
    this._colorSecundario, 
    this._bulletPrimario, 
    this._bulletSecundario  
  );

  double get currentPage => _currentPage;

  int get bulletPrimario => _bulletPrimario;
  set bulletPrimario(int tamano){
    _bulletPrimario = tamano;
  }

  int get bulletSecundario => _bulletSecundario;
  set bulletSecundario(int tamano){
    _bulletSecundario = tamano;
  }
  
  set currentPage(double currentPage){
    _currentPage = currentPage;
    notifyListeners(); // Notificar a los que esten escuchando el cambio
  }

  Color get colorPrimario => _colorPrimario; 
  set colorPrimario( Color color) {
    _colorPrimario = color; 
  }

   Color get colorSecundario => _colorSecundario; 
  set colorSecundario( Color color) {
    _colorSecundario = color; 
  }
}
