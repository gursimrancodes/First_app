import 'package:flutter/material.dart';
import 'package:flutter_application_1/methods/Auth_methods.dart';

class LoginInPage extends StatefulWidget {
  const LoginInPage({super.key});

  @override
  State<LoginInPage> createState() => _LoginInPageState();
}

class _LoginInPageState extends State<LoginInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _signInForm = GlobalKey<FormState>();

  void loginIN() {
    Auth.loginIN(_emailController.text, _passwordController.text, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                key: _signInForm,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
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
                      controller: _passwordController,
                      decoration: InputDecoration(
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
                    ElevatedButton(
                        onPressed: () {
                          if (_signInForm.currentState!.validate()) {
                            loginIN();
                          }
                        },
                        child: const Text("Login"))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}