import 'package:evently_app/UI/auth/models/user_model.dart';
import 'package:evently_app/core/common/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserAuthProvider extends ChangeNotifier {
  bool loading = false;
  UserModel? userModel;
  Future<String?> userLogin(
      {required String email, required String password}) async {
    loading = true;
    notifyListeners();
    try {
      userModel =
          await FirebaseServices.userLogin(email: email, password: password);
      loading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      loading = false;
      notifyListeners();
      return getErrorMessage(e);
    } on FirebaseException catch (e) {
      loading = false;
      notifyListeners();
      return 'Firebase error: ${e.plugin} - ${e.code}: ${e.message}';
    } catch (e) {
      loading = false;
      notifyListeners();
      return 'Unexpected error: $e';
    }
    return null;
    //return null;
  }

  Future<String?> userSignUp(
      {required String email,
      required String password,
      required String name}) async {
    loading = true;
    notifyListeners();
    try {
      userModel = await FirebaseServices.userSignUp(
          email: email, password: password, name: name);
      loading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      loading = false;
      notifyListeners();
      return getErrorMessage(e);
    } on FirebaseException catch (e) {
      loading = false;
      notifyListeners();
      return 'Firebase error: ${e.plugin} - ${e.code}: ${e.message}';
    } catch (e) {
      loading = false;
      notifyListeners();
      return 'Unexpected error: $e';
    }
    return null;
  }

  Future<void> getUser() async {
    userModel = await FirebaseServices.getUserInfo(
        FirebaseAuth.instance.currentUser!.uid);
    notifyListeners();
  }

  String getErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'user-disabled':
        return 'The user corresponding to the given email has been disabled.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Wrong password provided for that user.';
      case 'email-already-in-use':
        return 'An account already exists with this email.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Please contact support.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with a different credential.';
      case 'invalid-credential':
        return 'The credential is invalid.';
      case 'invalid-verification-code':
        return 'The verification code is invalid.';
      case 'invalid-verification-id':
        return 'The verification ID is invalid.';
      case 'too-many-requests':
        return 'Too many requests. Try again later.';
      default:
        return 'Authentication error: ${e.code} - ${e.message}';
    }
  }
}
