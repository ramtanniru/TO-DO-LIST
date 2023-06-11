import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class google_auth {
  // Google sign in
  Future<bool> signInWithGoogle() async {
    try {
      // Begin interactive sign in
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      // Obtain auth details from req
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      // Create a new credential for user
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // Sign in
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Authentication success
      return true;
    } catch (e) {
      // Authentication failure
      return false;
    }
  }
}
