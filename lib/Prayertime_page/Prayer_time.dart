import 'dart:convert';
import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:masjidapp/Prayertime_page/search.dart';

class PrayerTime extends StatefulWidget {
  @override
  State<PrayerTime> createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
  //get http;
 var data;
  //final String url = 'http://api.aladhan.com/v1/calendarByCity?city=London&country=United%20Kingdom&method=2&month=04&year=2017';
  //final String url = "https://reqres.in/api/users";
  //final String url = "http://api.aladhan.com/v1/calendarByAddress?address=Sultanahmet%20Mosque,%20Istanbul,%20Turkey&method=2&month=04&year=2017";

  final String url = "https://dailyprayer.abdulrcs.repl.co/api/singapore";
  final String url2= "https://dailyprayer.abdulrcs.repl.co/api/";
  String? city;

  @override
  void initState() {
    super.initState();
    getdata();
  }

  Future getdata() async {
    var response;
    if(city==null)
    response = await http.get(
      Uri.parse(url),
      //Uri.https(url),
      //headers: {"Accept": "application/json"}
    );
    else
      response = await http.get(
        Uri.parse(url2+city!),
        //Uri.https(url),
        //headers: {"Accept": "application/json"}
      );
    print(response.body);
    print("success");
    setState(() {
      var jsonData = jsonDecode(response.body);
      data = jsonData;
    });
    print(data);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Prayer Time",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 23.0,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.lightBlueAccent,
          elevation: 3.0,
        ),
        // body: FutureBuilder(
        //     //future: getdata(),
        //     builder: (context, snapshot) {
        //       if (snapshot.data == null)
        //         return Container(child: Text("Loading..."));
        //       else
        //         return ListView.builder(
        //             itemCount: deta == null ? 0 : deta.length,
        //             itemBuilder: (_, int index) {
        //               return Container(
        //                   color: Colors.tealAccent[200],
        //                   child: Column(
        //                     //crossAxisAlignment: CrossAxisAlignment.center,
        //                     //mainAxisAlignment: MainAxisAlignment.end,
        //                       children: [
        //                         Text("City : " + deta[index]['city'],
        //                           style: TextStyle(fontSize: 20.0),),
        //                         Text("Date : " + deta[index]['date'],
        //                           style: TextStyle(fontSize: 20.0),),
        //                         Text("Fajr : " + deta[index]['today']['Fajr'],
        //                           style: TextStyle(fontSize: 20.0),),
        //                         Text("Sunrise : " +
        //                             deta[index]['today']['Sunrise'],
        //                           style: TextStyle(fontSize: 20.0),),
        //                         Text("Dhuhr : " + deta[index]['today']['Dhuhr'],
        //                           style: TextStyle(fontSize: 20.0),),
        //                         Text("Asr : " + deta[index]['today']['Asr'],
        //                           style: TextStyle(fontSize: 20.0),),
        //                         Text("Maghrib : " +
        //                             deta[index]['today']['Maghrib'],
        //                           style: TextStyle(fontSize: 20.0),),
        //                         Text("Isha : " + deta[index]['today']["Isha'a"],
        //                           style: TextStyle(fontSize: 20.0),)
        //                       ]
        //                   )
                        body: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemExtent: 300.0,
                                itemCount: data == null ? 0 : 1,
                                itemBuilder: (_, int index) {
                                  if(data == null)
                                    return Container(child: Text("Loading..."));
                                  else
                                  return Container(
                                              color: Colors.tealAccent[200],
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                //mainAxisAlignment: MainAxisAlignment.end,
                                                // children: [
                                                //   Text("City : " + data[index]['city'], style: TextStyle(fontSize: 20.0),),
                                                //   Text("Date : " + data[index]['date'], style: TextStyle(fontSize: 20.0),),
                                                //   Text("Fajr : " + data[index]['today']['Fajr'], style: TextStyle(fontSize: 20.0),),
                                                //   Text("Sunrise : " + data[index]['today']['Sunrise'], style: TextStyle(fontSize: 20.0),),
                                                //   Text("Dhuhr : " + data[index]['today']['Dhuhr'], style: TextStyle(fontSize: 20.0),),
                                                //   Text("Asr : " + data[index]['today']['Asr'], style: TextStyle(fontSize: 20.0),),
                                                //   Text("Maghrib : " + data[index]['today']['Maghrib'], style: TextStyle(fontSize: 20.0),),
                                                //   Text("Isha : " + data[index]['today']["Isha'a"], style: TextStyle(fontSize: 20.0),),
                                                children: [
                                                  Text("Fajr : " + data['today']['Fajr'], style: TextStyle(fontSize: 20.0),),
                                                  Text("Sunrise : " + data['today']['Sunrise'], style: TextStyle(fontSize: 20.0),),
                                                  Text("Dhuhr : " + data['today']['Dhuhr'], style: TextStyle(fontSize: 20.0),),
                                                  Text("Asr : " + data['today']['Asr'], style: TextStyle(fontSize: 20.0),),
                                                  Text("Maghrib : " + data['today']['Maghrib'], style: TextStyle(fontSize: 20.0),),
                                                  Text("Isha : " + data['today']["Isha'a"], style: TextStyle(fontSize: 20.0),),
                                                ],
                                              ),
                                              padding: const EdgeInsets.all(10.0),


                                  );
                                }
                          ),
                            ),
                            Container(
                              child: Search()
                            )
                          ]
                        )
                     // );
                   // }
                );
          //  }
      //  )
  //  );
  }
}
