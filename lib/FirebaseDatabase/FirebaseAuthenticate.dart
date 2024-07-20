import '../config/import.dart';

class FirebaseAuthfunction {
  String msg = '';

  reistertofirebase(email, password) async {
    var result = false;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      result = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        msg = 'Invalid login credentials.';
      } else {
        msg = e.code;
      }

      Utils().toast(message: msg);
      result = false;
    }
    return result;
  }

  logintoFirebase(email, password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        msg = 'Invalid login credentials.';
      } else {
        msg = e.code;
      }
      Utils().toast(message: msg);
      return false;
    }
  }

  logoutTofirebase() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on Exception catch (e) {
      Utils().toast(message: e.toString());
      return false;
    }
  }

  googlesingin() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      Utils().toast(message: e.toString());
    }
  }
}
