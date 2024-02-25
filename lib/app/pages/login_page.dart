import 'package:axndlogin/app/components/signin_button.dart';
import 'package:axndlogin/app/components/custom_textfield.dart';
import 'package:axndlogin/app/components/social_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // textField editing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

// sign user in method
  void signUserIn() async {
    // show loadind circle
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
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'test@gmail.com',
        password: '11122223333',
      );
      // pop the loading circle
      //Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print("Error-------------->>>");
      print(e);
      // pop the loading circle

      // Navigator.pop(context);

      // WRONG EMAIL
      if (e.code == 'user-not-found') {
        // show error to user
        print("Error-------------->>>");
        print(e);
        //wrongEmailMessage();
      }

      //     // WRONG PASSWORD
      //     else if (e.code == 'wrong-password') {
      //       // show error to user
      //       print("Error-------------->>>");
      //       print(e);
      //       print('wrong-password');

      //       // wrongPasswordMessage();
      //     }
      //   }
      // }

      // // wrong email message popup
      // void wrongEmailMessage() {
      //   showDialog(
      //     context: context,
      //     builder: (context) {
      //       return const AlertDialog(
      //         backgroundColor: Colors.deepPurple,
      //         title: Center(
      //           child: Text(
      //             'Incorrect Email',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //         ),
      //       );
      //     },
      //   );
    }

    // // wrong password message popup
    // void wrongPasswordMessage() {
    //   showDialog(
    //     context: context,
    //     builder: (context) {
    //       return const AlertDialog(
    //         backgroundColor: Colors.deepPurple,
    //         title: Center(
    //           child: Text(
    //             'Incorrect Password',
    //             style: TextStyle(color: Colors.white),
    //           ),
    //         ),
    //       );
    //     },
    //   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Center(
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
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
