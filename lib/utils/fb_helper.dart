import 'package:firebase_auth/firebase_auth.dart';

class FbHelper {
  static FbHelper fbHelper = FbHelper._();

  FbHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void signUp({
    required email,
    required password,
  }) {
    firebaseAuth
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then(
          (value) => print(
            "Success",
          ),
        )
        .catchError(
          (e) => print(
            "Failed $e",
          ),
        );
  }
}
