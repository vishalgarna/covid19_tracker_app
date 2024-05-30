import 'package:covid_tracker/pages/Detail_country.dart';
import 'package:shimmer/shimmer.dart';
import 'package:covid_tracker/Repository/Api/Get_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class coutnrieslist extends StatefulWidget {
  const coutnrieslist({super.key});

  @override
  State<coutnrieslist> createState() => _coutnrieslistState();
}

class _coutnrieslistState extends State<coutnrieslist> {

 TextEditingController serachcontroller =TextEditingController();

  State_service services =State_service();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:  Text('Coutries_list'),
      ),
      body: Column(
        children: [
    Container(
      margin: EdgeInsets.all(8),
      child: TextField(
        onChanged: (value){
          setState(() {

          });
        },
                  controller: serachcontroller,
                  decoration: InputDecoration(
                    suffix: Icon(Icons.search),
                    label: Text('Enter the Country name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)
                    )
                  ),
                ),
    ),
          Expanded(
            child: FutureBuilder(future: services.get_countries_data(), builder: (context, AsyncSnapshot<List<dynamic>>snapshot){
              if(!snapshot.hasData){
                return Shimmer.fromColors(
                    child: ListView.separated(
                      separatorBuilder: (context,index){
                        return Divider(height: 20,);
                      },
                    itemCount:15,
                    itemBuilder: (context , index){
                      return ListTile(
                        title: Container(color: Colors.white,height: 25,width: 400,),
                        subtitle:Container(color: Colors.white,height: 25,width: 400,),
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                         ),
                      );
                    }),

                    baseColor: Colors.grey.shade200, highlightColor: Colors.black38);

              }

              else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      String value = snapshot.data![index]['country'].toString();
                      if(serachcontroller.text.isEmpty){
                        return ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>details_country(
                                flag:  snapshot.data![index]['countryInfo']['flag'].toString(),
                                recovered:  snapshot.data![index]['recovered'].toString(),
                                activecases:  snapshot.data![index]['active'].toString(),
                                deaths: snapshot.data![index]['deaths'].toString(),
                                totalcases:  snapshot.data![index]['cases'].toString(),
                                title: snapshot.data![index]['country'].toString())

                            )
                            );




                          },
                          title: Text(snapshot.data![index]['country']
                              .toString()),
                          subtitle: Text(snapshot.data![index]['updated'].toString()),
                          leading: CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(
                                  snapshot.data![index]['countryInfo']['flag']
                                      .toString())),
                        );
                      }
                      else if(value.toLowerCase().contains(serachcontroller.text.toLowerCase())){
                        return ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>details_country(
                                flag:  snapshot.data![index]['countryInfo']['flag'].toString(),
                                recovered:  snapshot.data![index]['recovered'].toString(),
                                activecases:  snapshot.data![index]['active'].toString(),
                                deaths: snapshot.data![index]['deaths'].toString(),
                                totalcases:  snapshot.data![index]['cases'].toString(),
                                title: snapshot.data![index]['country'].toString())

                            )
                            );




                          },
                          title: Text(snapshot.data![index]['country']
                              .toString()),
                          subtitle: Text(snapshot.data![index]['updated'].toString()),
                          leading: CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(
                                  snapshot.data![index]['countryInfo']['flag']
                                      .toString())),
                        );
                      }
                      else{
                        return Container();
                      }

                    });
              } }),
          )

        ],
      ),
    );
  }
}
