import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class SignInResponse {
  final bool completed;
  final String message;

  SignInResponse(this.completed, this.message);
}

class RegisterResponse {
  final bool completed;
  final String message;

  RegisterResponse(this.completed, this.message);
}

Future<SignInResponse> signIn(String email, String password) async {
  try {
    await Firebase.initializeApp();
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return SignInResponse(true, "User signed in");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return SignInResponse(false, "User not found");
    }
    if (e.code == 'wrong-password') {
      return SignInResponse(false, "Invalid credentials");
    }
    return SignInResponse(false, "Unable to sign in");
  }
}

Future<RegisterResponse> register(String email, String password) async {
  try {
    await Firebase.initializeApp();
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return RegisterResponse(true, "User registered");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      return RegisterResponse(false, "The password is too weak.");
    } else if (e.code == 'email-already-in-use') {
      return RegisterResponse(false, "Email already registered.");
    } else if (e.code == 'invalid-email') {
      return RegisterResponse(false, "Invalid email.");
    } else {
      return RegisterResponse(false, "Internal error.");
    }
  } catch (e) {
    return RegisterResponse(false, "Internal error.");
  }
}
