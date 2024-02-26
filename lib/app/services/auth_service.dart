// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

// // sign user in
//   Future<String?> signUserIn(
//       {required String email, required String password}) async {
//     try {
//       await _firebaseAuth.signInWithEmailAndPassword(
//           email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       switch (e.code) {
//         case 'user-not-found':
//           return '::::: User not found';

//         case 'wrong-password':
//           return ':::: Password error';
//       }
//       return e.code;
//     }
//     return null;
//   }

//   //

// // sign user out
//   Future<String?> signUserOut() async {
//     try {
//       await _firebaseAuth.signOut();
//     } on FirebaseAuthException catch (e) {
//       return e.code;
//     }
//     return null;
//   }
// }
