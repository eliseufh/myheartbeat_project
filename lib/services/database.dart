import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore _fire = FirebaseFirestore.instance;

  void create(String username, String password) {
    try {
      _fire.collection("Users").add({
        "username": username,
        "password": password
      });
    } catch (e) {
      log(e.toString());
    }
  }
}