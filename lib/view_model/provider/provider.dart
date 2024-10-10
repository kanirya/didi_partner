import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:didipartner/utils/utils.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/owner_model.dart';

class AuthProvider extends ChangeNotifier {
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _uid;
  String get uid => _uid!;

  OwnerModel? _ownerModel;
  OwnerModel get ownerModel => _ownerModel!;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  AuthProvider() {
    checkSign();
  }

  // Check if the user is signed in
  void checkSign() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool("is_signedin") ?? false;
    if (_isSignedIn) {
      getDataFromSP();  // Load user data if signed in
    }
    notifyListeners();
  }
  // Set the user sign-in state in SharedPreferences
  Future setSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.setBool("is_signedin", true);
    _isSignedIn = true;
    notifyListeners();
  }




  // Sign in with email and password
  void signInWithEmail({
    required BuildContext context,
    required String email,
    required String password,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();
    print('Starting signInWithEmail');  // Debugging Step 1
    try {
      // Attempting to sign in with Firebase Authentication
      User user = (await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      )).user!;
      print('User signed in successfully: ${user.uid}');  // Debugging Step 2

      if (user != null) {
        _uid = user.uid;
        onSuccess();
      }
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e.message}');  // Debugging Step 3
      showSnackBar(context, e.message.toString());
    } catch (e) {
      print('Exception during sign-in: $e');  // Debugging Step 4
      showSnackBar(context, e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
      print('Finished signInWithEmail');  // Debugging Step 5
    }
  }

  // Check if the user data exists in Firestore
  Future<bool> checkExistingUser() async {
    DocumentSnapshot snapshot =
    await _firebaseFirestore.collection("owners").doc(_uid).get();
    return snapshot.exists;
  }

  // Fetch data from Firestore for the signed-in user
  Future getDataFromFireStore() async {
    DocumentSnapshot snapshot =
    await _firebaseFirestore.collection("owners").doc(_uid).get();
    _ownerModel = OwnerModel.fromMap(snapshot.data() as Map<String, dynamic>);
    _uid = _ownerModel!.uid;
  }

  // Save user data to SharedPreferences
  Future saveOwnerDataToSP() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    await s.setString("owner_model", jsonEncode(ownerModel.toMap()));
  }

  // Get data from SharedPreferences
  Future getDataFromSP() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    String data = s.getString("owner_model") ?? '';
    _ownerModel = OwnerModel.fromMap(jsonDecode(data));
    _uid = _ownerModel!.uid;
    notifyListeners();
  }

  // Sign out the user and clear data
  Future userSignOut() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = false;
    notifyListeners();
    s.clear();
  }
}
