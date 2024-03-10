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

  Future<Object?> getUserData(uid) async {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) async {
        if (documentSnapshot.exists) {
          print('exists');
          Object? data = documentSnapshot.data();
          return data;
        } else {
          print('doesnt exist');
          return null;
        }
      });
    } catch (e) {
      return 'Error';
    }
    return null;
  }
}
