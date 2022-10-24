import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'user_informations.g.dart';

class UserInformationsMobx = _UserInformationsBase with _$UserInformationsMobx;

abstract class _UserInformationsBase with Store {
  @observable
  Map<String, dynamic> userInformations = {};


  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  @action
  Future<void> GetUserInformations() async {
    var userID = _auth.currentUser!.uid;

    userInformations = (await _firestore
            .doc("students/$userID/Student Info/Student Info")
            .get())
        .data()!;
  }
}
