import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/authentication/controllers/sendCode/write_verification_code_abstract.dart';
import 'package:strava/features/authentication/controllers/sendCode/write_verification_code_state.dart';

final sWriteVerificationCodeProvider = NotifierProvider<SWriteVerificationCodeState, SWriteVerificationCodeStateType>(SWriteVerificationCodeState.new);