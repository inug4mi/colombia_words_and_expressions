import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/word.dart';

class WordService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Word>> getWords() {
    return _db.collection('Dictionary').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Word.fromMap(doc.data()))
          .toList();
    });
  }
}