import 'package:cloud_firestore/cloud_firestore.dart';

class StoreUser {
  StoreUser(
      {required this.uid,
      required this.username,
      required this.email,
      required this.bio,
      required this.profileImg});

  final String username;
  final String uid;
  final String email;
  final String bio;
  final String profileImg;

  Map<String, dynamic> tojson() => {
        'Username': username,
        'email': email,
        'Bio': bio,
        'uid': uid,
        'ProfileImg': profileImg,
      };

  static StoreUser fromJson(DocumentSnapshot<Map<String, dynamic>> data) {
    return StoreUser(
        username: data['Username'],
        uid: data['uid'],
        email: data['email'],
        bio: data['Bio'],
        profileImg: data['ProfileImg']);
  }
}
