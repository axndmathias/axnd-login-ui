import 'package:axndlogin/app/components/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/custom_textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

// send a password reset email
  Future<void> passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.deepPurple,
            title: Center(
              child: Text(
                e.message.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      );
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
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // icon

                const Icon(Icons.lock_reset_rounded, size: 120),

                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'Enter Your Email and we will send you a password reset link',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),
                ),

                // reset email textfield
                const SizedBox(height: 20),
                CustomTextField(
                  controller: emailController,
                  hinText: 'Email',
                ),

                // reset password button
                const SizedBox(height: 30.0),
                CustomButton(
                    onTap: passwordReset, textButton: 'Reset Password'),
                const SizedBox(height: 150)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
