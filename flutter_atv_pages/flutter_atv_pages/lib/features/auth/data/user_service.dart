import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final _col = FirebaseFirestore.instance.collection('users');

  Future<void> register({required String name, required String email}) async {
    // usa email como docId pra evitar duplicados
    await _col.doc(email).set({
      'name': name,
      'email': email,
      'createdAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }
}
