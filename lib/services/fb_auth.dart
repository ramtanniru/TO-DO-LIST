import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class fb_auth {
  Future<bool> signInWithFb() async {
    try {
      //sign in
      final LoginResult loginResult = await FacebookAuth.instance.login();

      //credentials access token
      final OAuthCredential fbAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      //User credentials
      FirebaseAuth.instance.signInWithCredential(fbAuthCredential);
      return true;
    } catch (e) {
      return false;
    }
  }
}
