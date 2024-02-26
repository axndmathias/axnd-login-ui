import 'package:axndlogin/app/components/custom_button.dart';
import 'package:axndlogin/app/components/custom_textfield.dart';
import 'package:axndlogin/app/components/social_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // textField editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //final AuthService authService = AuthService();

// sign user in method
  void singInUserUp(BuildContext context) async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try creating the user
    try {
      // check if password is confirmed
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        // show error message, passwords don't match
      }
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
              const Icon(Icons.lock_rounded, size: 50),

              // Let\'s create an account for you!
              const SizedBox(height: 40),
              Text(
                'Let\'s create an account for you!',
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

              // confirm password textfield
              const SizedBox(height: 10),
              CustomTextField(
                controller: confirmPasswordController,
                hinText: 'Confirm Password',
                obscureText: true,
              ),

              // forgot password
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              // sign up button
              const SizedBox(height: 25),
              CustomButton(
                textButton: 'Sign Up',
                onTap: () {
                  singInUserUp(context);
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
                    'Already have an account?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text('Login now',
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
