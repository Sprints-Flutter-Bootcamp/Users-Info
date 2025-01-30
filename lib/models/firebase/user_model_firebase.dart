import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUser {
  final String? name;
  final String? email;
  final String? age;

  FirebaseUser({
    this.name,
    this.email,
    this.age,
  });

  factory FirebaseUser.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    // SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return FirebaseUser(
      name: data?['name'],
      email: data?['email'],
      age: data?['age'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (age != null) "age": age
    };
  }
}
