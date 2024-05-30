

import 'package:covid_tracker/Models/World_state_data.dart';
import 'package:covid_tracker/pages/Countries_page.dart';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Repository/Api/Get_api.dart';


class Myhomepage extends StatefulWidget {
  String title = '';
      Myhomepage( {super.key,
        required this.title
}
);

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> with TickerProviderStateMixin{
 late final AnimationController controller =AnimationController(
    duration: Duration(seconds: 3),
      vsync: this)..repeat();
  State_service services =State_service();

  var colors =[
    Colors.blue,
    Colors.greenAccent,
    Colors.red,

 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
 automaticallyImplyLeading: false,
      title: Text(widget.title),
     backgroundColor: Colors.black26,
    ),

      body: Column(
        children: [
          FutureBuilder(future: services.get_data(), builder:(context,AsyncSnapshot<WorldStateData>snapshot){
            if(!snapshot.hasData){
              return Center(
                child: SpinKitCircle(
                  controller: controller,
                  color: Colors.black,

                ),
              );
            }
            else{
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: PieChart(

                        chartType: ChartType.ring,
                        colorList: colors,
                        dataMap:{
                          "Total":double.parse(snapshot.data!.cases.toString()),
                          "Recovered":double.parse(snapshot.data!.recovered.toString()),
                          "Deaths":double.parse(snapshot.data!.deaths.toString()),
                        }),
                  ),

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(

                        children: [
                          Reusable_row(title: 'Total', value: snapshot.data!.cases.toString()),
                          Reusable_row(title: 'Recovered', value: snapshot.data!.recovered.toString()),
                          Reusable_row(title: 'Deaths', value:snapshot.data!.deaths.toString()),
                          Reusable_row(title: 'Active', value:snapshot.data!.active.toString()),
                        ],
                      ),
                    ),
                  )
                  ,
                  SizedBox(height: 50,),
                  Container(
                    height: 50,
                    width: 250,
                    child: ElevatedButton(onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>coutnrieslist()));

                    }, child: Text('Track_countries')),
                  )
                ],
              );
            }
          }),


        ],
      ),

    );
  }
}

class Reusable_row extends StatelessWidget {
  String title, value ;
  Reusable_row({super.key ,required this.title,required this.value  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

        Text(title,style:  TextStyle(fontSize: 20)),
        Text(value,style:  TextStyle(fontSize: 20))
      ],),
    );
  }
}
