import 'package:ems/app/shared/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseUserRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<UserModel> signInWithEmailPassword({
    @required String email,
    @required String password,
  }) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    FirebaseUser firebaseUser = result.user;

    if (firebaseUser != null) {
      IdTokenResult idToken = await firebaseUser.getIdToken();
      return UserModel(
        id: idToken.token,
        name: firebaseUser.displayName,
        email: firebaseUser.email,
      );
    }
    return null;
  }

  Future<UserModel> createUserWithEmailPassword({
    @required String email,
    @required String password,
  }) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    FirebaseUser firebaseUser = result.user;

    if (firebaseUser != null) {
      IdTokenResult idToken = await firebaseUser.getIdToken();
      return UserModel(
        id: idToken.token,
        name: firebaseUser.displayName,
        email: firebaseUser.email,
      );
    }

    return null;
  }

  Future<Null> recoveryPassword({@required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
    return;
  }

  Future<Null> logoutUser() async {
    await _firebaseAuth.signOut();
    return;
  }
}
