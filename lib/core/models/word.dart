class Word {
  final String word;
  final String description;

  Word({
    required this.word,
    required this.description,
  });

  factory Word.fromMap(Map<String, dynamic> map) {
    return Word(
      word: map['word'] ?? '',
      description: map['description_es'] ?? '',
    );
  }
}