import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'user_informations.g.dart';

// ignore: library_private_types_in_public_api
class UserInformationsMobx = _UserInformationsBase with _$UserInformationsMobx;

abstract class _UserInformationsBase with Store {
  @observable
  Map<String, dynamic> userInformations = {};

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @action
  // ignore: non_constant_identifier_names
  Future<void> GetUserInformations() async {
    var userID = _auth.currentUser!.uid;

    userInformations = (await _firestore
            .doc("students/$userID/Student Info/Student Info")
            .get())
        .data()!;
  }
}
