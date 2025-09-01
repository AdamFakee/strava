import 'package:strava/data/services/auth/auth_services.dart';
import 'package:strava/features/authentication/models/user_model.dart';
import 'package:strava/utils/exceptions/handle_exception/handle_firebase_exception.dart';

class SAuthRepos {
  static final SAuthRepos _instance = SAuthRepos._internal();
  SAuthRepos._internal();
  factory SAuthRepos() => _instance;

  // variables
  final _authService = SAuthServices();

  /* --------- CORE ------------ */

  Future<SUserModel> singinWithGoogle() async {
    return await SHandleFirebaseException<SUserModel>(() async {
      final userCredential = await _authService.signinWithGoogle();
      if(userCredential == null) {
        return throw("Login with google have fail");
      }

      final user = userCredential.user;
      if(user == null) throw("Login with google have fail");

      return SUserModel(
        id: user.uid, 
        username: user.displayName ?? "", 
        email: user.email ?? ""
      );
    });
  }

  Future<SUserModel> singinWithFacebook() async {
    return await SHandleFirebaseException<SUserModel>(() async {
      final userCredential = await _authService.signinWithFacebook();
      if(userCredential == null) {
        return throw("Login with facebook have fail");
      }

      final user = userCredential.user;
      if(user == null) throw("Login with facebook have fail");

      return SUserModel(
        id: user.uid, 
        username: user.displayName ?? "", 
        email: user.email ?? ""
      );
    });
  }
}
