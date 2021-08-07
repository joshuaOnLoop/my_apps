import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// RandomWords Widget
class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _favorited = <WordPair>[];

  void _navigate() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      final tiles =
          _favorited.map((pair) => ListTile(title: Text(pair.asCamelCase)));

      final divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return Scaffold(
          appBar: AppBar(title: Text("Favorited")),
          body: ListView(children: divided));
    }));
  }

  updateAddFavorited(int index) {
    setState(() {
      if (_favorited.contains(_suggestions[index]))
        _favorited.remove(_suggestions[index]);
      else
        _favorited.add(_suggestions[index]);
    });
  }

  Widget _buildSuggestions() {
    return ListView.separated(
        itemCount: 100,
        itemBuilder: (context, index) {
          if (index >= _suggestions.length)
            _suggestions.addAll(generateWordPairs().take(10));

          final alreadyFavorited = _favorited.contains(_suggestions[index]);
          final color = alreadyFavorited ? Colors.red : null;
          final icon = alreadyFavorited
              ? Icon(Icons.favorite, color: color)
              : Icon(Icons.favorite_border_outlined, color: color);
          final iconButton = IconButton(
            icon: icon,
            onPressed: () => updateAddFavorited(index),
          );

          return ListTile(
              title: Text(_suggestions[index].asCamelCase),
              trailing: iconButton,
              onTap: () => print(5));
        },
        separatorBuilder: (context, index) {
          return Divider();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("The Flutter App"), actions: [
          IconButton(
            icon: Icon(Icons.list, color: null),
            onPressed: _navigate,
          )
        ]),
        body: Center(
          child: _buildSuggestions(),
        ));
  }
}
