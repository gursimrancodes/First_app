import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/LoginInPage.dart';
import 'package:flutter_application_1/methods/Auth_methods.dart';
import 'package:flutter_application_1/utils/pickImage.dart';
import 'package:image_picker/image_picker.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _bioController = TextEditingController();

  final _signInForm = GlobalKey<FormState>();
  Uint8List? _image;



  void signIn() {
    if (_passwordController.text == _confirmPasswordController.text) {
      Auth().signIN(
        _emailController.text,
        _passwordController.text,
        _usernameController.text,
        _image,
        _bioController.text,
        context,
      );
    }
  }

  selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

    @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _bioController.dispose();
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 65,
                          backgroundImage: MemoryImage(_image!),
                          backgroundColor: Colors.red,
                        )
                      : const CircleAvatar(
                          radius: 65,
                          backgroundImage: NetworkImage(
                              'https://img.freepik.com/premium-vector/avatar-icon002_750950-52.jpg'),
                          backgroundColor: Colors.red,
                        ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: () {
                          selectImage();
                        },
                        icon: const Icon(Icons.add_a_photo),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                  key: _signInForm,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                            hintText: 'Username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.5),
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your Username";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.5),
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your email";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _bioController,
                        decoration: InputDecoration(
                            hintText: 'Bio',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.5),
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Add your Bio";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.5),
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your Password";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.5),
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Confirm your Password";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (_signInForm.currentState!.validate()) {
                              signIn();
                              return;
                            }
                          },
                          child: const Text("SignIn")),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LoginInPage()));
                          },
                          child: const Text("Already have an account!"))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
