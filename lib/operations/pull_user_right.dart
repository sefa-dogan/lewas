import 'package:cloud_firestore/cloud_firestore.dart';

class PullUserRight {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late int _lastOnlineDay;

  Future<int> UserRightsControl(String userID) async {
    var result = (await _firestore
            .doc("students/$userID/Student Info/Student Info")
            .get())
        .data();
    if (result != null) {
      _lastOnlineDay = result["Last Online"];
      // ignore: unrelated_type_equality_checks
      if (_lastOnlineDay != DateTime.now().day) {
        await _firestore
            .doc("students/$userID/Student Info/Student Info")
            .update({"daily right": 10, "Last Online": DateTime.now().day});

        return (await _firestore
                .doc("students/$userID/Student Info/Student Info")
                .get())
            .data()!["daily right"];
      } else {
        return (await _firestore
                .doc("students/$userID/Student Info/Student Info")
                .get())
            .data()!["daily right"];
      }
    } else {
      return Future.error("Belirtilen adres null değer gönderdi.");
    }
  }
}
