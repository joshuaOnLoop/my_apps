import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Album {
  final int userId;
  final int id;
  final String title;

  Album(this.userId, this.id, this.title);

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(json['userId'], json['id'], json['title']);
  }
}

class Fetch extends StatefulWidget {
  const Fetch({Key key}) : super(key: key);

  @override
  _FetchState createState() => _FetchState();
}

class _FetchState extends State<Fetch> {
  Future<Album> _futureAlbum;
  final TextEditingController _controller = TextEditingController();
  var x = 5;

  @override
  void initState() {
    super.initState();
    _controller.text = "https://jsonplaceholder.typicode.com/albums/1";
    fetchAlbum();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void fetchAlbum() async {
    final response = await http.get(Uri.parse(_controller.text));

    if (response.statusCode == 200) {
      this._futureAlbum = Future<Album>.value(Album.fromJson(jsonDecode(response.body)));
      setState(() {
      
      });
    } else
      throw Exception('Failed to load album');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Fetch Demo"),
          actions: [],
        ),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Enter URL"),
                )),
            FutureBuilder<Album>(
                future: this._futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData)
                    return Text(snapshot.data.title);
                  else if (snapshot.hasError) return Text('${snapshot.error}');
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                }),
            RaisedButton(
              child : Text("Fetch"),
              onPressed: fetchAlbum,
            )
          ],
        ));
  }
}
