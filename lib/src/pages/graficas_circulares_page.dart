import 'package:disenos_app/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({Key? key}) : super(key: key);

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
 

  late double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child:const Icon(Icons.refresh),
        onPressed: (){
          setState(() {
            porcentaje += 10;
            if(porcentaje > 100){
              porcentaje = 0;
            }
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.yellow),   
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.purple),   
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.green),   
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.red),   
            ],
          )
        ],
      )
    );
  }
}

class CustomRadialProgress extends StatelessWidget {

  final Color color;
   CustomRadialProgress({super.key, 
    required this.porcentaje,
    required this.color
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      // color: Colors.red,
      child: RadialProgress( 
      porcentaje: porcentaje, 
      colorPrimario: this.color,
      colorSecundario: Colors.grey,
      grosorPrimario: 15,
      grosorSecundario: 10,
      )
      // child: Text('$porcentaje %', style: TextStyle(fontSize: 50.0),),
    );
  }
}
