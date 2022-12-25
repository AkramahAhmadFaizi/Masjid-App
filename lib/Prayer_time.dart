import 'dart:convert';
import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class PrayerTime extends StatefulWidget {
  @override
  State<PrayerTime> createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
  //get http;
  late List data;
  //final String url = 'http://api.aladhan.com/v1/calendarByCity?city=London&country=United%20Kingdom&method=2&month=04&year=2017';
  //final String url = "https://reqres.in/api/users";
  final String url ="http://api.aladhan.com/v1/calendarByAddress?address=Sultanahmet%20Mosque,%20Istanbul,%20Turkey&method=2&month=04&year=2017";
  @override
  void initState(){
    super.initState();
    getdata();
  }

  Future<String> getdata() async {
    var response = await http.get(
        Uri.parse(url),
        headers: {"Accept": "application/json"}
    );

    setState(() {
      var jsonData = jsonDecode(response.body);
      data = jsonData['data'];
    });

    print(data);
    print("success");
    print(data.length);
    return "success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Prayer Time",
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
        body: ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (_, int index) {
              return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                        child: Container(
                          color: Colors.tealAccent[200],
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("email : " + data[index]['timings']['Fajr']),

                            ],
                          ),
                          padding: const EdgeInsets.all(10.0),
                        ),
                      )
                    ],
                  )


              );
            }
        )
    );
  }
}
