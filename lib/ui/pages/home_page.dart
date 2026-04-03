import 'package:flutter/material.dart';
import 'package:colombia_words_and_expressions/core/services/word_service.dart';
import 'package:colombia_words_and_expressions/ui/widgets/word_tile.dart';
import 'package:colombia_words_and_expressions/core/models/word.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final wordService = WordService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Colombia Words & Expressions'),
        backgroundColor: Colors.yellow,
      ),
      body: StreamBuilder<List<Word>>(
        stream: wordService.getWords(),
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No hay palabras"));
          }

          final words = snapshot.data!;

          return ListView.builder(
            itemCount: words.length,
            itemBuilder: (context, index) {
              return WordTile(word: words[index]);
            },
          );
        },
      ),
    );
  }
}