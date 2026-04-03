import 'package:flutter/material.dart';
import '../../core/models/word.dart';

class WordTile extends StatefulWidget {
  final Word word;

  const WordTile({super.key, required this.word});

  @override
  State<WordTile> createState() => _WordTileState();
}

class _WordTileState extends State<WordTile> {
  bool isExpanded = false;

  void toggle() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

      child: Column(
        children: [

          // 🔹 BOTÓN (la palabra)
          ListTile(
            title: Text(
              widget.word.word,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              //textAlign: TextAlign.center,
            ),

            trailing: Icon(
              isExpanded ? Icons.expand_less : Icons.expand_more,
            ),

            onTap: toggle,
          ),

          // 🔹 DESCRIPCIÓN (condicional)
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Text(
                widget.word.description,
                style: const TextStyle(fontSize: 16),
              ),
            ),
        ],
      ),
    );
  }
}