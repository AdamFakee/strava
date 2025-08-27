import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/data/repos/auth/auth_repos.dart';
import 'package:strava/data/repos/user/user_repo.dart';
import 'package:strava/features/authentication/controllers/social_auth/social_auth_abstract.dart';
import 'package:strava/features/authentication/controllers/term_and_condition.dart/term_and_condition_provider.dart';

class SSocialAuthState extends AsyncNotifier<SSocialAuthStateType> implements SSocialAuthAbstract {
  @override
  FutureOr<SSocialAuthStateType> build() {
    return SSocialAuthStateType(socialType: null);
  }

  // variables
  final _authRepo = SAuthRepos();
  final _userRepo = SUserRepos();

  @override
  void signinWithGoogle() async {
    // check use agree term and condition
    final isAgrred = ref.read(STermAndConditionProvider);
    if (isAgrred == false) {
      state = AsyncError(
        "Must be agree term and condition to login",
        StackTrace.current,
      );
      return;
    }

    // change state (flag) loading for google
    state = AsyncData(SSocialAuthStateType.copyWith(SSocialEnum.google));
    
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final user = await _authRepo.singinWithGoogle();
      await _userRepo.saveUserRecord(user);
      return SSocialAuthStateType(socialType: null);
    });
  }

  @override
  void signinWithFacebook() async {
    // check use agree term and condition
    final isAgrred = ref.read(STermAndConditionProvider);
    if (isAgrred == false) {
      state = AsyncError(
        "Must be agree term and condition to login",
        StackTrace.current,
      );
      return;
    }

    // change state (flag) loading for facebook
    state = AsyncData(SSocialAuthStateType.copyWith(SSocialEnum.facebook));

    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final user = await _authRepo.singinWithFacebook();
      await _userRepo.saveUserRecord(user);
      return SSocialAuthStateType(socialType: null);
    });
  }
}
