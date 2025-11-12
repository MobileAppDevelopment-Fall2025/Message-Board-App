import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<UserCredential> signInEmailPass(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      final user = userCredential.user;
      if (user == null) {
        throw FirebaseAuthException(
          code: 'no-user',
          message: 'Sign-in succeeded but no user returned.',
        );
      }

      await _fireStore.collection('users').doc(user.uid).set(
        {
          'uid': user.uid,
          'email': email,
        },
        SetOptions(merge: true),
      );

      notifyListeners();

      return userCredential;
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      throw Exception('Sign-in failed: $e');
    }
  }

  Future<UserCredential> signUpEmailPass(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      final user = userCredential.user;
      if (user == null) {
        throw FirebaseAuthException(
          code: 'no-user',
          message: 'Sign-up succeeded but no user returned.',
        );
      }

      await _fireStore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'email': email,
      }, SetOptions(merge: true));

      notifyListeners();

      return userCredential;
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      throw Exception('Sign-up failed: $e');
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    notifyListeners();
  }
}
