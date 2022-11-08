import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: const Center(
          // Add the const
          //child: Text(wordPair.asPascalCase), // REPLACE with...
          child: RandomWords(), // ...this line
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  var _suggestions = generateWordPairs().take(100).toList();
  final _biggerFont = const TextStyle(fontSize: 18); // NEW

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: (_) {
                      setState(() {});
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _suggestions = (generateWordPairs().take(100).toList());
                    });
                  },
                  icon: const Icon(Icons.update),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: ListView.builder(
            itemCount: _suggestions.length,
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (context, i) {
              return _suggestions[i].asString.contains(searchController.text)
                  ? ListTile(
                      title: Text(
                        _suggestions[i].asPascalCase,
                        style: _biggerFont,
                      ),
                    )
                  : const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
