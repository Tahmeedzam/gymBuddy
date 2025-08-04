import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gymbuddy/models/userFormData.dart';

class FirebaseUserService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Create Firebase user and upload profile to Firestore
  static Future<bool> createUserProfile({required UserModel userModel}) async {
    try {
      // Step 1: Create user in Firebase Auth
      final credential = await _auth.createUserWithEmailAndPassword(
        email: userModel.email!,
        password: userModel.password!,
      );
      final uid = credential.user!.uid;

      // Step 2: Prepare user model
      userModel.prepareForSaving(uid: uid);

      // Step 3: Push to Firestore
      await _firestore.collection('users').doc(uid).set(userModel.toMap());

      print('✅ User data successfully uploaded to Firestore');
      return true;
    } catch (e) {
      print('❌ Firebase upload error: $e');
      return false;
    }
  }
}
