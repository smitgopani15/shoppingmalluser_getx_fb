import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FbHelper {
  static FbHelper fbHelper = FbHelper._();

  FbHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  GoogleSignInAuthentication? googleSignInAuthentication;

  Future<String?> signUp({
    required email,
    required password,
  }) async {
    String? msg;
    var credential = await firebaseAuth
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then(
          (value) => msg = "account successfully created !",
        )
        .catchError(
          (e) => msg = "account creation failed !",
        );
    return msg;
  }

  Future<String?> signIn({
    required email,
    required password,
  }) async {
    String? msg;
    var credential = await firebaseAuth
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then(
          (value) => msg = "login successfully !",
        )
        .catchError(
          (e) => msg = "login failed !",
        );
    return msg;
  }

  Future<String?> googleSignIn() async {
    String? msg;
    GoogleSignInAccount? user = await GoogleSignIn().signIn();
    googleSignInAuthentication = await user!.authentication;
    var crd = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication!.accessToken,
      idToken: googleSignInAuthentication!.idToken,
    );
    await firebaseAuth
        .signInWithCredential(crd)
        .then(
          (value) => msg = "login successfully !",
        )
        .catchError(
          (e) => msg = "login failed !",
        );
    return msg;
  }

  bool checkUser() {
    User? user = firebaseAuth.currentUser;
    return user != null;
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
