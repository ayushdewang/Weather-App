import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var city_name = ["Sonkatch", "Dewas", "Sehore", "Bhopal", "Indore", "Ashta","Ujjain"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    Map? info = ModalRoute.of(context)?.settings.arguments as Map?;
    String temp =  ((info?['temp_value']).toString());
    String air = ((info?['air_speed_value']).toString());
    if(temp == "NA")
      {
        print("NA");
      }
    else
      {
        temp =  ((info?['temp_value']).toString());
        air = ((info?['air_speed_value']).toString());
      }
    String icon = info?['icon_value'];
    String getcity = info?['city_value'];
    String hum = info?['hum_value'];
    String des = info?['des_value'];

    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(0),
      //   child: AppBar(
      //     backgroundColor: Colors.blue,
      //   )
      // ),
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blue,
        )
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.lightBlue, Colors.deepPurple])),
            child: Column(
              children: [
                Container(
                  //Search Wala Container

                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if((searchController.text).replaceAll(" ", "") == "")
                            {
                              print("Blank search");
                            }else{
                            Navigator.pushReplacementNamed(context, "/loading",arguments: {
                              "searchText" : searchController.text,
                            });
                          }

                        },
                        child: Container(
                          child: Icon(
                            Icons.search_outlined,
                            color: Colors.blueAccent,
                            size: 30,
                          ),
                          margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Search $city"),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white.withOpacity(0.5)),
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          padding: EdgeInsets.all(10),
                          child: Row(children: [
                            Image.network("http://openweathermap.org/img/wn/$icon@2x.png"),
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                Text("$des",style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),),
                                Text("In $getcity",style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),)
                              ],
                            )
                          ])),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.thermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("$temp",style: TextStyle(

                                    fontSize: 90
                                ),),
                                Text("C",style: TextStyle(
                                    fontSize: 30
                                ),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.day_windy)
                              ],
                            ),
                            SizedBox(height: 30,)
                            ,
                            Text("$air",style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                            ),),
                            Text("km/hr")
                          ],
                        ),
                        height: 200,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                        padding: EdgeInsets.all(26),
                        height: 200,
                        child:  Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.humidity)
                              ],
                            ),
                            SizedBox(height: 30,)
                            ,
                            Text("$hum",style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                            ),),
                            Text("Percent")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60,),
                Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Openweathermap.org")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}