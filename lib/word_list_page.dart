import 'package:basic_example/favorite_list_page.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

Set<WordPair> _saved = Set<WordPair>();
class WordListPage extends StatelessWidget {

  const WordListPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello My first app'),
        actions: <Widget>[
          IconButton(onPressed: (){
            print('click action button');
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavoriteListPage(_saved.toList())));
          }, icon: Icon(Icons.favorite))
        ],
      ),
      body: Center(child: RandomWords()),
    );
  }
}


class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  List<WordPair> words = [];


  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index >= words.length) words.addAll(generateWordPairs().take(10));
        return _getRow(words[index]);
      },
    );
  }

  Widget _getRow(WordPair wordPair) {
    bool _isAlreadySaved = _saved.contains(wordPair);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          onTap: () {
            setState(() {
              if (_isAlreadySaved) {
                _saved.remove(wordPair);
              } else {
                _saved.add(wordPair);
              }
            });

            print(_saved.toString());
          },
          trailing: Icon(
            _isAlreadySaved ?
            Icons.favorite : Icons.favorite_border,
            color: _isAlreadySaved ? Colors.redAccent : Colors.grey,
          ),
          title: Text(
            wordPair.asCamelCase,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Divider(
          color: Colors.grey[300],
          height: 5,
          thickness: 1,
          indent: 16,
          endIndent: 16,
        ),
      ],
    );
  }
}
