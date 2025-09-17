import 'dart:math';

/// class using for generate something.
/// 
/// `example`: `random string`.....
class SGenerateHelpers {

  static String getRandomString({
    int length = 10
  }) {
    const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
    length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }


}