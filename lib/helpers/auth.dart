import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static bool checkAuth() {
    if (auth.currentUser != null) {
      return true;
    }
    else {
      return false;
    }
  }

  static Future<bool> signIn(String email, String pass) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email, password: pass
      );
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

  static Future<String> getToken() async {
    try {
      if (checkAuth()) {
        var token = await auth.currentUser!.getIdToken();
        return token;
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }

  static Future<bool> signOut() async {
    try {
      auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}