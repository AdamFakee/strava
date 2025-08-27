import 'package:strava/data/services/user/user_service.dart';
import 'package:strava/features/authentication/models/user_model.dart';
import 'package:strava/utils/exceptions/handle_exception/handle_firebase_exception.dart';

class SUserRepos {
  static final SUserRepos _instance = SUserRepos._internal();
  SUserRepos._internal();
  factory SUserRepos() => _instance;

  // variables
  final _userService = SUserServices();

  // core
  
  /// insert user to db
  Future<void> saveUserRecord(SUserModel user) async {
    await SHandleFirebaseException<void>(() async {
      await _userService.saveUserRecord(user);
    });
  }
}