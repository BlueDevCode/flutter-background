import 'dart:math';

import 'package:flutter/material.dart';


class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({super.key, required MaterialColor backgroundColor});

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {
  double porcentaje = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.pink,
      onPressed: () { 
        porcentaje += 10;
        if( porcentaje > 100){
          porcentaje = 0;
        }
        setState(() {
          
        });
       },
      child: const Icon( Icons.refresh),

      ),
     body: Center(
       child: Container(
        padding: EdgeInsets.all(5),
        width: 300,
        height: 300,
       // color: Colors.red,
        child: CustomPaint(
        painter: _MiRadialProgress(porcentaje),
        
        ),
        
        
        ),
     )



    );
  }
}
class _MiRadialProgress extends CustomPainter{

final porcentaje;
_MiRadialProgress(this.porcentaje);


  @override
  void paint (Canvas canvas, Size size){
    

    //Circulo completado
  final paint = Paint()
  ..strokeWidth = 4
  .. color = Colors.grey
  .. style = PaintingStyle.stroke;
  final center = Offset(size.width * 0.5,size.height/2);
  final radio = min(size.width * 0.5, size.height * 0.5);

  canvas.drawCircle( center,radio,paint);

// Arco
 final paintArco = Paint()
  ..strokeWidth = 10
  .. color = Colors.pink
  .. style = PaintingStyle.stroke;
// Parte que se deberá ir llenando
double arcAngle = 2 * pi * ( porcentaje / 100);
canvas.drawArc(
  Rect.fromCircle( center: center, radius: radio),
  -pi/2,
  arcAngle,
  false,
  paintArco
);

}
  @override
 bool shouldRepaint(CustomPainter oldDelegate) => true;

}