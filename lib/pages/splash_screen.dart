import 'dart:async';
import 'package:covid_tracker/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'dart:math'as math;

class Splah_screen extends StatefulWidget {
  const Splah_screen({super.key});

  @override
  State<Splah_screen> createState() => _Splah_screenState();
}

class _Splah_screenState extends State<Splah_screen> with TickerProviderStateMixin {
   late final AnimationController controller = AnimationController(
     duration: Duration(seconds: 3),
       vsync: this)..repeat();

   @override
   void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  void initState() {
     // TODO: implement initState
     super.initState();
     Timer(Duration(seconds: 5), () =>
         Navigator.pushReplacement(context, MaterialPageRoute(
             builder: (context) => Myhomepage(title: 'World_Status'))));
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
       AnimatedBuilder(animation: controller, builder: (BuildContext context ,Widget?child){
         return Transform.rotate(angle: controller.value *2.0 *math.pi
         ,child: Image(image: AssetImage('images/virus.png'),));
       }),
          
          SizedBox(height: MediaQuery.of(context).size.height*.08,),
          
          Align(
              alignment: Alignment.center,
              child: Text('Covid19 app',style:  TextStyle(fontSize: 20),))

        ],
      ),
    );


  }
}
