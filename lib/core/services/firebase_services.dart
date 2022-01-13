import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  final CollectionReference games =
      FirebaseFirestore.instance.collection("games");
  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");

  Future<bool> usernameCheck(String username) async {
    final result = await users.where('username', isEqualTo: username).get();
    return result.docs.isEmpty;
  }
}
