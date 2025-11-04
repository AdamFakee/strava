// a class contain route name for entire screens in app
class SAppRouterNames {
  // auth
  static const String login = "/auth/login";
  static const String register = "/auth/register";
  static const String alterSendCodeToEmail = "/auth/sendCodeToEmail/alter";
  static const String writeEmailCodeGiven = "/auth/sendCodeToEmail/write";
  static const String onboarding = '/auth/onboarding';

  // not required auth
  static const String homeTab = "/home";
  static const String mapTab = '/map';

  // you tab
  static const String settings = '/you/settings';
  static const String languages = '/you/language';
  static const String themeMode = '/you/themeMode';

  // chat 
  static const String chat = '/chat';
}