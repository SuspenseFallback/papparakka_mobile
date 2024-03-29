import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcard_app_mobile/firebase/database_service.dart';

class AuthService {
  Future<String?> logIn(email, password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return '200';
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        return '401';
      } else if (e.code == 'user-not-found') {
        return '401';
      } else if (e.code == 'wrong-password') {
        return '401';
      }
    }

    return '401';
  }

  Future<DocumentSnapshot?> getUser() async {
    User? user = FirebaseAuth.instance.currentUser;

    DocumentSnapshot? data = await DatabaseService().getUserData(user?.uid);
    return data;
  }
}
