import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/LoginInPage.dart';
import 'package:flutter_application_1/methods/Auth_methods.dart';

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
  final _phonenumController = TextEditingController();

  final _signInForm = GlobalKey<FormState>();

  String signIn() {
    if (_passwordController.text == _confirmPasswordController.text) {
      Auth().signIN(_emailController.text, _passwordController.text, _usernameController.text,_phonenumController.text, context, );
      return 'signIn';
    }
    return 'Enter same password';
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
                        controller: _phonenumController,
                        decoration: InputDecoration(
                            hintText: 'PhoneNumer',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.5),
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your phonenumber";
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
                              String res = signIn();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text(res)));
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
