abstract class SSocialAuthAbstract {
  void signinWithGoogle () async {}
  void signinWithFacebook () async {}
}

/// nums of social platform is supported auth in "STRAVA"
enum SSocialEnum { google, facebook}

class SSocialAuthStateType {
  final SSocialEnum? socialType;

  SSocialAuthStateType({required this.socialType});

  factory SSocialAuthStateType.copyWith(SSocialEnum type) {
    return SSocialAuthStateType(socialType: type);
  }
}