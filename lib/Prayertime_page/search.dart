import 'package:flutter/material.dart';
import 'package:masjidapp/Prayertime_page/Prayer_time.dart';
import 'Prayer_time.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  final TextEditingController _textController=TextEditingController();
  void _handleSubmitted(String text)
  {
    _textController.clear();
    //getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(child: TextField(
            decoration: InputDecoration.collapsed(hintText: "Enter the city"),
            onSubmitted: _handleSubmitted,
            controller: _textController,
          )),
          Container(
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: ()=>_handleSubmitted(_textController.text),
          )

          )
        ],
      ),
    );
  }
}
