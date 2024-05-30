import 'package:covid_tracker/pages/homepage.dart';
import 'package:flutter/material.dart';

class details_country extends StatelessWidget {
 String title , flag , recovered , activecases, deaths,totalcases ;
  details_country({super.key ,
    required this.flag,
    required this.recovered,
    required this.activecases,
    required this.deaths,
    required this.totalcases,
    required this.title,


  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title:Text(title) ,
    ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Card(
          child: Column(
            children: [
              CircleAvatar(backgroundImage: NetworkImage(flag),radius: 40,),
              Reusable_row(title: 'Total_cases', value: totalcases),
              Reusable_row(title: 'active_cases', value: activecases),
              Reusable_row(title: 'Deaths', value: deaths),
              Reusable_row(title: 'Critical', value: recovered),


            ],
          )
        )

      ],),

    );
  }
}
