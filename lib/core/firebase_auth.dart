import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// A class that handles authentication using Firebase Auth.
class FirebaseAuthenticator {
  /// Logs in the user with the provided username and password.
  ///
  /// If the login is successful, the user is redirected to the home screen.
  /// If the login fails, an error message is displayed.
  ///
  /// Parameters:
  /// - [context]: The context of the current widget.
  /// - [_usernameController]: The controller for the username input field.
  /// - [_passwordController]: The controller for the password input field.
  Future<void> login(context, usernameController, passwordController) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: usernameController.text,
              password: passwordController.text);

      Navigator.pushNamed(context, '/home',
          arguments: userCredential.user!.email);
    } on FirebaseAuthException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Wrong username or password'),
        ),
      );
    }
  }

  /// Signs up a new user with the provided email and password.
  ///
  /// If the signup is successful, the user is redirected to the home screen.
  /// If the signup fails, an error message is displayed.
  ///
  /// Parameters:
  /// - [context]: The context of the current widget.
  /// - [_emailController]: The controller for the email input field.
  /// - [_passwordController]: The controller for the password input field.
  Future<void> signUp(context, emailController, passwordController) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      Navigator.pushNamed(context, '/home',
          arguments: userCredential.user!.email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('The password provided is too weak.'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            elevation: 10,
            backgroundColor: Colors.red,
            content: Text("ID/Password not accepted. Please change it."),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  /// Signs in the user using Google authentication.
  ///
  /// This method initiates the Google sign-in process and retrieves the user's
  /// Google account information. It then uses the obtained authentication
  /// credentials to sign in the user with Firebase Authentication. If the sign-in
  /// is successful, the user is navigated to the home screen of the app.
  ///
  /// Parameters:
  /// - [context]: The build context of the current widget.
  ///
  /// Throws:
  /// - [FirebaseAuthException]: If the Google sign-in fails, an exception is thrown
  ///   and a snackbar is displayed to inform the user.
  ///
  /// Returns:
  /// - [Future<void>]: A future that completes when the sign-in process is finished.
  Future<void> googleAuth(context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
      ).signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.pushNamed(context, '/home',
          arguments: userCredential.user!.email);
    } on FirebaseAuthException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Google Sign In Failed. Please try again.'),
        ),
      );
    }
  }
}
