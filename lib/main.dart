import 'package:basic_example/word_list_page.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WordPair wordPair = WordPair.random();

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: WordListPage(),
    );
  }
}
