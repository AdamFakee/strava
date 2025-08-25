import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/authentication/controllers/sendCode/write_verification_code_abstract.dart';
import 'package:strava/utils/const/global.dart';

/// các trường hợp cần xử lý bao gồm:
/// nhập xong => tự focus ô kế tiếp nếu như còn & ô vừa nhập bị disable
class SWriteVerificationCodeState extends Notifier<SWriteVerificationCodeStateType> implements SWriteVerificationCodeAbstract{
  @override
  List<bool> build() {
    return _initState();
  }

  /// return [true, false,....]
  List<bool> _initState () {
    final List<bool> state = List.generate(SGlobals.numOfInputsVerifyCode, (idx) {
      return idx == 0 ? true : false;
    });

    return state;
  }

  /// nhập xong ô input này => đổi trạng thái thành false ( disable) => nếu còn có ô phía sau => đổi ô đó thành true (enable)
  @override
  void next (int idx) {
    if(state[idx]) {
      final newState = [...state];

      // disable ô vừa nhập
      newState[idx] = false;

      // enable ô tiếp theo
      if(idx < SGlobals.numOfInputsVerifyCode - 1) newState[idx + 1] = true;
      state = newState;
    }
  }

  @override
  void reset () {
    state = _initState();
  }

}