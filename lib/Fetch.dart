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
  Future<Album> futureAlbum;

  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/2'));

    if (response.statusCode == 200)
      return Album.fromJson(jsonDecode(response.body));
    else
      throw Exception('Failed to load album');
  }

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Fetch Demo"),
          actions: [],
        ),
        body: FutureBuilder<Album>(
            future: this.futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData)
                return Text(snapshot.data.title);
              else if (snapshot.hasError) return Text('${snapshot.error}');

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            }));
  }
}
