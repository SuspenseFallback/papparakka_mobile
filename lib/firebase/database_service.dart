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
}
