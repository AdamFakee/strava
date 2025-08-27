import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/authentication/controllers/social_auth/social_auth_abstract.dart';
import 'package:strava/features/authentication/controllers/social_auth/social_auth_state.dart';

// ignore: non_constant_identifier_names
final SSocialAuthProvider = AsyncNotifierProvider<SSocialAuthState, SSocialAuthStateType>(() => SSocialAuthState(),);