import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FbHelper {
  static FbHelper fbHelper = FbHelper._();

  FbHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  GoogleSignInAuthentication? googleSignInAuthentication;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<String?> signUp({
    required email,
    required password,
  }) async {
    String? msg;
    await firebaseAuth
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
    await firebaseAuth
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
    await GoogleSignIn().signOut();
  }

  Future<String?> resetPassword({
    email,
  }) async {
    String? msg;
    await firebaseAuth
        .sendPasswordResetEmail(email: email)
        .then(
          (value) => msg = "password successfully change !",
        )
        .catchError(
          (e) => msg = "password reset failed !",
        );
    return msg;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readItem() {
    User? user = firebaseAuth.currentUser;
    var uid = user!.uid;
    return firebaseFirestore
        .collection("admin")
        .doc(uid)
        .collection("item")
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readCategoryData(
    String category,
  ) {
    User? user = firebaseAuth.currentUser;
    var uid = user!.uid;
    return firebaseFirestore
        .collection("admin")
        .doc(uid)
        .collection("item")
        .where("category", whereIn: [category]).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readNameData(String name) {
    User? user = firebaseAuth.currentUser;
    var uid = user!.uid;
    return firebaseFirestore
        .collection("admin")
        .doc(uid)
        .collection("item")
        .where("name", whereIn: [name]).snapshots();
  }
}
