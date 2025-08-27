import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:strava/features/authentication/models/user_model.dart';

class SUserServices {
  // single ton
  static final SUserServices _instance = SUserServices._internal();
  SUserServices._internal();
  factory SUserServices() => _instance;

  // variable
  final _db = FirebaseFirestore.instance;

  // core

  /// save user data to storage when register
  Future<void> saveUserRecord (SUserModel user) async {
    await _db.collection("Users").doc(user.id).set(user.toJson());
  }
  
}