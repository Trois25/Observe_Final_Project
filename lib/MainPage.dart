import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class AnimeMainPage extends StatefulWidget {
  const AnimeMainPage({Key? key}) : super(key: key);

  @override
  State<AnimeMainPage> createState() => _AnimeMainPageState();
}

class _AnimeMainPageState extends State<AnimeMainPage> {
  late Map mapResponse;
  late Map dataResponse;

  Future apicall()async{
    http.Response response;
    response = await http.get(Uri.parse("https://api.jikan.moe/v4/recommendations/anime"));
    if(response.statusCode == 200){
      setState(() {
        mapResponse = json.decode(response.body);
        dataResponse = mapResponse['data'];
      });
    }else{
      Text('ada error');
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime List'),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.green),
          child: Center(
            child: Container(
              child: Text(dataResponse['entry''title'].toString()),
            ),
          ),
          ),
        ),
      );
  }
}
