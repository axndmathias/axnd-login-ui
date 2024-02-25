import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;
  final AuthService authService = AuthService();

// sign user out
  // Future<String?> signUserOut() async {
  //   try {
  //     await FirebaseAuth.instance.signOut().then((value) => null);
  //   } on FirebaseAuthException catch (e) {
  //     return e.code;
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
            onPressed: () {
              authService.signUserOut();
            },
            icon: const Icon(Icons.logout),
            color: Colors.white,
          )
        ],
      ),
      body: Center(
        child: Text(
          'LOGGED IN AS: ${user.email}',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
