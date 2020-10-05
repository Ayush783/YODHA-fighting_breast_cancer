import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future addUser(String email, bool value) async {
    await firestore.collection('users').doc(email).set({
      "recieving_mails": value,
    });
  }

  Future updateUserStatus(String email, String status) async {
    await firestore.collection('users').doc(email).collection('data').add({
      "status": status,
    });
  }
}
