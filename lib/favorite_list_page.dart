import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteListPage extends StatelessWidget {
  final List<WordPair> favorites;

  const FavoriteListPage(
    this.favorites, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('this is favorit page' + favorites.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite List Page'),
      ),
      body: ListView.separated(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favorites[index].toString()),
          );
        },
        separatorBuilder: (context, index) => Divider(thickness: 1,),
      ),
    );
  }
}
