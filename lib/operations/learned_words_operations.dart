import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LearnedWordsOperations {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _userID;
  LearnedWordsOperations() {
    _userID = _auth.currentUser!.uid;
  }

  Future<Map<String, dynamic>> pullLearnedWordsAndMeans() async {
    return (await _firestore
            .doc("students/$_userID/learnedwords/learnedwords")
            .get())
        .data()!;
  }

  Future<List<String>> pullLearnedWordsKeys() async {
    return (await _firestore
            .doc("students/$_userID/learnedwords/learnedwords")
            .get())
        .data()!
        .keys
        .toList();
  }

  // ignore: non_constant_identifier_names
  void DeleteLearnedWord(String willDeleteWord) async {
    await _firestore
        .doc("students/$_userID/learnedwords/learnedwords")
        .update({willDeleteWord: FieldValue.delete()});
  }
}
