import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future<Object?> getSets() async {
    try {
      QuerySnapshot sets =
          await FirebaseFirestore.instance.collection('sets').get();
      return sets.docs;
    } catch (e) {
      return 'Error';
    }
  }

  Future<DocumentSnapshot?> getUserData(uid) async {
    late DocumentSnapshot result;

    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) async {
        result = documentSnapshot;
      });
    } catch (e) {
      return null;
    }

    return result;
  }
}
