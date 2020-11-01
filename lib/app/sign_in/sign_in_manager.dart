import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:time_tracker_app/services/auth.dart';

class SignInManager {
  final AuthBase auth;
  final ValueNotifier<bool> isLoading;
  SignInManager({@required this.auth, @required this.isLoading});

  Future<User> _signIn(Future<User> Function() signInMethod) async {
    try {
      isLoading.value = true;
      return await signInMethod();
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  Future<User> signInAnonymously() async =>
      await _signIn(auth.signInAnonymously);

  Future<User> signInWithGoogle() async => await _signIn(auth.signInWithGoogle);

  Future<User> signInWithFacebook() async =>
      await _signIn(auth.signInWithFacebook);
}
