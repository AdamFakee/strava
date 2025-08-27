import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/authentication/controllers/term_and_condition.dart/term_and_condition_abstract.dart';

class STermAndConditionState extends Notifier<STermAndConditionStateType> implements STermAndConditionAbstract {
  @override
  STermAndConditionStateType build() {
    return false;
  }
  
  @override
  void toggle() {
    state = !state;
  }
}