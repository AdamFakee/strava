// ignore_for_file: unused_element
abstract class SWriteVerificationCodeAbstract {

  /// return [true, false,....]
  List<bool> _initState ();

  /// nhập xong ô input này => đổi trạng thái thành false ( disable) => nếu còn có ô phía sau => đổi ô đó thành true (enable)
  void next (int idx);

  /// reset state
  void reset ();
}

/// type for state
typedef SWriteVerificationCodeStateType = List<bool>;
