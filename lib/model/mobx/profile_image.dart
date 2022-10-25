import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'profile_image.g.dart';

// ignore: library_private_types_in_public_api
class ProfileImage = _ProfileImageBase with _$ProfileImage;

abstract class _ProfileImageBase with Store {
  @observable
  XFile? _file;
  @observable
  ImageProvider<Object>? pic;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage profileRef = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @action
  // ignore: non_constant_identifier_names
  Future<void> UploadPicture(String path) async {
    var userId = _auth.currentUser!.uid;
    // ignore: no_leading_underscores_for_local_identifiers
    var _task =
        profileRef.ref("usersProfileImages/$userId").putFile(File(path));
    await _task.whenComplete(() async {
      // ignore: no_leading_underscores_for_local_identifiers
      var _url =
          await profileRef.ref("usersProfileImages/$userId").getDownloadURL();
      _firestore
          .doc("students/$userId")
          .collection("Student Info")
          .doc("Student Info")
          .set({"profilePicUrl": _url.toString()}, SetOptions(merge: true));
    });
  }

  @action
  // ignore: non_constant_identifier_names
  Future<void> GetUserProfilePicture() async {
    var userID = _auth.currentUser!.uid;
    var result = (await _firestore
            .doc("students/$userID/Student Info/Student Info")
            .get())
        .data();
    if (result != null && result["profilePicUrl"] != null) {
      pic = NetworkImage(result["profilePicUrl"]);
    } else {
      return await Future.error("Belirtilen adres null gönderdi");
    }
  }
}
