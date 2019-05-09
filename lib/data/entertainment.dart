import 'package:flutter_web/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class FashionNews extends StatefulWidget {
  @override
  _FashionNewsState createState() => _FashionNewsState();
}

class _FashionNewsState extends State<FashionNews> {
  final String url = "https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=3fc464c420834d6fb76899f176e1ae6d";
  List data;
  bool isdataloaed = false;
  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    setState(() {
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson['articles'];
      isdataloaed = true;
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[900],
      child: isdataloaed
          ? ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(5.0),
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Image.network(data[index]['urlToImage'],fit:BoxFit.cover),
                    Divider(),
                    Card(
                      color: Colors.blueGrey[800],
                      child: Text(
                        data[index]['title'],
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      ),
                    ),
                    Divider(
                      height: 20.0,
                    ),
                  ],
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
                strokeWidth: 6.0,
              ),
            ),
    );
    ;
  }
}
