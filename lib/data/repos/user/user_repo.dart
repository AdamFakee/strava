import 'package:firebase_auth/firebase_auth.dart';
import 'package:strava/data/services/user/user_service.dart';
import 'package:strava/features/authentication/models/user_model.dart';
import 'package:strava/utils/database/database.dart';
import 'package:strava/utils/database/tables/user/user_queries.dart';
import 'package:strava/utils/exceptions/handle_exception/handle_firebase_exception.dart';
import 'package:strava/utils/local_storage/share_preference/share_preference_storage.dart';

class SUserRepos {
  static final SUserRepos _instance = SUserRepos._internal();
  SUserRepos._internal();
  factory SUserRepos() => _instance;

  // variables
  final _auth = FirebaseAuth.instance;
  final _userService = SUserServices();
  final _db = SDatabase().db;

  /* --------- CORE ------------ */
  
  
  /// if user login => init necesselly neet to use for use
  Future<void> setupForCurrentUser() async {
    return await SHandleFirebaseException(() async {
      // check login
      final user = _auth.currentUser;
      if (user != null) {
        // init storage for this user
        await SharePreferenceStorage().init(user.uid);

        // create table for current user if not exits
        await _db.execute(SUserQueries.createUserIfNotExitsByUserId(user.uid));
      } else {
        SharePreferenceStorage().dispose();
      }
    });
  }
  /// insert user to db
  Future<void> saveUserRecord(SUserModel user) async {
    await SHandleFirebaseException<void>(() async {
      await _userService.saveUserRecord(user);
    });
  }
}