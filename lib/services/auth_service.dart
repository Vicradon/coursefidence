import 'package:coursefidence/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _signinerrormessage = "";
  String _signuperrormessage = "";

  get signinerrormessage => _signinerrormessage;
  get signuperrormessage => _signuperrormessage;

  // create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      switch (error.code) {
        case "ERROR_INVALID_EMAIL":
          _signinerrormessage = "Your email address appears to be malformed.";
          break;
        case "ERROR_WRONG_PASSWORD":
          _signinerrormessage = "Your password is wrong.";
          break;
        case "ERROR_USER_NOT_FOUND":
          _signinerrormessage = "User with this email doesn't exist.";
          break;
        case "ERROR_USER_DISABLED":
          _signinerrormessage = "User with this email has been disabled.";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          _signinerrormessage = "Too many requests. Try again later.";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          _signinerrormessage =
              "Signing in with Email and Password is not enabled.";
          break;
        default:
          _signinerrormessage = "An error occured.";
      }
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      switch (error.code) {
        case "ERROR_OPERATION_NOT_ALLOWED":
          _signuperrormessage = "Anonymous accounts are not enabled";
          break;
        case "ERROR_WEAK_PASSWORD":
          _signuperrormessage = "Your password is too weak";
          break;
        case "ERROR_INVALID_EMAIL":
          _signuperrormessage = "Your email is invalid";
          break;
        case "ERROR_EMAIL_ALREADY_IN_USE":
          _signuperrormessage = "Email is already in use on different account";
          break;
        case "ERROR_INVALID_CREDENTIAL":
          _signuperrormessage = "Your email is invalid";
          break;

        default:
          _signuperrormessage = "An error occured";
      }
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
