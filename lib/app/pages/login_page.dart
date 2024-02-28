import 'package:axndlogin/app/components/custom_textfield.dart';
import 'package:axndlogin/app/components/social_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/custom_button.dart';
import 'forgot_pwd_page.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // textField editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //final AuthService authService = AuthService();

// sign user in method
  void singInUserIn(BuildContext context) async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // pop the loading circle
      if (context.mounted) Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      // show error message
      showErrorMessage(e.code);
    }
  }

// error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // logo
              const SizedBox(height: 20),
              const Icon(Icons.lock_rounded, size: 100),

              // Welcome back, you're been missed!
              const SizedBox(height: 40),
              Text(
                'Welcome back GYM member, Get fit now!',
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),

              // username textfield
              const SizedBox(height: 25),
              CustomTextField(
                controller: emailController,
                hinText: 'Email',
              ),

              // password textfield
              const SizedBox(height: 10),
              CustomTextField(
                controller: passwordController,
                hinText: 'Password',
                obscureText: true,
              ),

              // forgot password
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ForgotPasswordPage();
                        }));
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),

              // sign in button
              const SizedBox(height: 25),
              CustomButton(
                textButton: 'Sign In',
                onTap: () {
                  singInUserIn(context);
                },
              ),

              // or continue with
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('Or continue with'),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              // google & apple buttons
              const SizedBox(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google button
                  SocialButton(
                    imagePath: 'assets/images/google.png',
                  ),
                  SizedBox(width: 25.0),
                  // apple button
                  SocialButton(
                    imagePath: 'assets/images/apple.png',
                  )
                ],
              ),

              // not a member? register now
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text('Register now',
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
