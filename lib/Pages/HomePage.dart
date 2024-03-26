import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/methods/Auth_methods.dart';
import 'package:flutter_application_1/models/user_models.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StoreUser? _user;

  final _auth = FirebaseAuth.instance;

  Future<StoreUser?> getData() async {
    var user = await FirebaseFirestore.instance
        .collection("User")
        .doc(_auth.currentUser!.uid)
        .get();
    if (user.exists) {
      print("user exist");
      setState(() {
         _user = StoreUser.fromJson(user);
      });
      print(_user);
      return (_user);
    }
    return null;
  }

  @override
  void initState() {
    getData();
    print('called');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _user != null?(
            Text(_user!.username)
          ):(
            CircularProgressIndicator()
          ),
          ElevatedButton(
              onPressed: () {
                Auth.signOut(context);
              },
              child: const Text("signOut"))
        ],
      )),
    );
  }
}
