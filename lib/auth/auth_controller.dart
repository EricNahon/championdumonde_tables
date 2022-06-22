import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../config/config.dart';
import '../app/widgets/app_snackbar.dart';

class AuthController with ChangeNotifier {
  AuthController() {
    firebaseAuth = FirebaseAuth.instance;
    authProvider = GoogleAuthProvider();
  }
  
  late final FirebaseAuth firebaseAuth;
  late final GoogleAuthProvider authProvider;

  Stream<User?> get authStateChange {
    return firebaseAuth.authStateChanges();
  }

  Future<void> signout() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn(clientId: GOOGLE_CLIENT_ID);

    await googleSignIn.signOut();
    await googleSignIn.disconnect();
    await auth.signOut();
  }

  Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (error) {
      AppSnackBar(
        context: context,
        content: Text(
          error.message!,
          style: const TextStyle(color: Colors.white),
        ),
      );
    } catch (error) {
      debugPrint('$error');
    }

    return user;
  }

  Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (error) {
      AppSnackBar(
        context: context,
        content: Text(
          error.message!,
          style: const TextStyle(color: Colors.white),
        ),
      );
    }

    return user;
  }

  Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }

  Future<User?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(clientId: GOOGLE_CLIENT_ID);

    try {
      final GoogleSignInAccount? googleuser = await googleSignIn.signIn();
      if (googleuser == null) return null;

      final googleAuth = await googleuser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (error) {
      debugPrint(error.toString());
    }

    return FirebaseAuth.instance.currentUser;
  }


  void signOutGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(clientId: GOOGLE_CLIENT_ID);
    FirebaseAuth auth = FirebaseAuth.instance;

    await googleSignIn.signOut();
    await googleSignIn.disconnect();
    await auth.signOut();

    debugPrint("User signed out of Google account");
  }

  void passwordReset({required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
