import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcard_app_mobile/firebase/database_service.dart';

class AuthService {
  Future<String?> logIn(email, password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return '200';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    }

    return '202';
  }

  Future<User?> getUser() async {
    User? user = FirebaseAuth.instance.currentUser;

    Object? data = await DatabaseService().getUserData(user?.uid);
    print('data $data');
    return user;
  }
}
