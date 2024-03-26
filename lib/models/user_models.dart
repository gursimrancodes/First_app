import 'package:cloud_firestore/cloud_firestore.dart';

class StoreUser {
  StoreUser({
    required this.username,
    required this.email,
    required this.phoneNum,
  });

  final String username;
  final String email;
  final String phoneNum;

  Map<String, dynamic> tojson() => {
        'Username': username,
        'email': email,
        'phoneNum': phoneNum,
      };

  static StoreUser fromJson(DocumentSnapshot<Map<String, dynamic>> data) {
    return StoreUser(
        username: data['Username'],
        email: data['email'],
        phoneNum: data['phoneNum']);
  }
}
