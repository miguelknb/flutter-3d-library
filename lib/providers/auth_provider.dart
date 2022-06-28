import 'package:firebase_auth/firebase_auth.dart';
import '../generated/l10n.dart';
import '../models/user_model.dart';
import 'package:flutter/widgets.dart';

class AuthResponse {
  final bool completed;
  final String message;

  AuthResponse(this.completed, this.message);
}

class AuthProvider extends ChangeNotifier {
  late FirebaseAuth _auth;
  UserModel? _user;

  UserModel? get user => _user;

  AuthProvider() {
    _auth = FirebaseAuth.instance;
    _user = null;
  }

  UserModel _userFromFirebase(User? user) {
    if (user == null) {
      return UserModel(displayName: 'Null', uid: 'null');
    }

    return UserModel(
        uid: user.uid,
        email: user.email,
        displayName: user.displayName,
        phoneNumber: user.phoneNumber,
        photoUrl: user.photoURL);
  }

  Future<AuthResponse> signIn(String email, String password, S s) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      _user = _userFromFirebase(credential.user);
      return AuthResponse(true, "User signed in");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return AuthResponse(false, S.current.userNotFound);
      }
      if (e.code == 'wrong-password') {
        return AuthResponse(false, S.current.wrongPassword);
      }
      return AuthResponse(false, S.current.unableToSignIn);
    }
  }

  Future<AuthResponse> register(String email, String password, S s) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _user = _userFromFirebase(credential.user);
      return AuthResponse(true, "User registered");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return AuthResponse(false, S.current.weakPassword);
      } else if (e.code == 'email-already-in-use') {
        return AuthResponse(false, S.current.emailAlreadyInUse);
      } else if (e.code == 'invalid-email') {
        return AuthResponse(false, S.current.invalidEmail);
      } else {
        return AuthResponse(false, S.current.internalError);
      }
    } catch (e) {
      return AuthResponse(false, S.current.internalError);
    }
  }

  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  void UpdateProfile(String displayName, String photoURL){
    _auth.currentUser?.updateDisplayName(displayName);
    _auth.currentUser?.updatePhotoURL(photoURL);
  }
}
