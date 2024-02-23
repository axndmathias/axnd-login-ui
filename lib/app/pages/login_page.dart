import 'package:axndlogin/app/components/signin_button.dart';
import 'package:axndlogin/app/components/custom_textfield.dart';
import 'package:axndlogin/app/components/social_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // textField editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

// sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // logo
            const SizedBox(height: 30),
            const Icon(Icons.lock_rounded, size: 100),

            // Welcome back, you're been missed!
            const SizedBox(height: 40),
            Text(
              'Welcome back, you\'re been missed!',
              style: TextStyle(color: Colors.grey[700], fontSize: 16),
            ),

            // username textfield
            const SizedBox(height: 25),
            CustomTextField(
              controller: usernameController,
              hinText: 'Username',
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
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            // sign in button
            const SizedBox(height: 25),
            SigninButton(
              onTap: signUserIn,
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
                Text('Register now',
                    style: TextStyle(
                        color: Colors.grey[700], fontWeight: FontWeight.bold)),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
