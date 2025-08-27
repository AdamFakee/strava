import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SAuthServices {
  // single ton
  static final SAuthServices _instance = SAuthServices._internal();
  SAuthServices._internal();
  factory SAuthServices() => _instance;

  // variable
  final _auth = FirebaseAuth.instance;

  /* --------- CORE ------------ */
  
  Future<UserCredential?> signinWithGoogle () async {
    await GoogleSignIn().signOut();

    final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

    if (userAccount == null) return null;

    final GoogleSignInAuthentication googleAuth = await userAccount.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await _auth.signInWithCredential(credential);
  }

  Future<UserCredential?> signinWithFacebook () async {
    final LoginResult result = await FacebookAuth.instance.login();
      switch (result.status) {
        case LoginStatus.success: 
          // Create a credential from the access token
          final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.tokenString);

          // Once signed in, return the UserCredential
          return await _auth.signInWithCredential(credential);
        case LoginStatus.failed:
          throw("Login with facebook have something wrong. Pls retry or login by other methods");
        default:
          return null;
      }
  }
  
}