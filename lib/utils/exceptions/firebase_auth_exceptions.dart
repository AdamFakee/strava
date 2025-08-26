class TFirebaseAuthExceptions {
  TFirebaseAuthExceptions(this.code);

  final String code;

  String get message {
    switch (code) {
      case "email-already-in-use":
        return "The email address is already in use by another account.";
      case "invalid-email":
        return "The email address is not valid. Please enter a valid email.";
      case "weak-password":
        return "The password is too weak. Please choose a stronger password with at least 6 characters.";
      case "user-not-found":
        return "No account found with this email. Please sign up first.";
      case "wrong-password":
        return "Incorrect password. Please try again or reset your password.";
      case "too-many-requests":
        return "Too many requests. Please try again after 5-10 mins.";
      case "operation-not-allowed":
        return "This sign-in method is currently disabled. Please try another method.";
      case "invalid-credential":
        return "The authentication credential is invalid or expired.";
      case "account-exists-with-different-credential":
        return "An account already exists with the same email but different sign-in credentials.";
      case "invalid-verification-code":
        return "The verification code is invalid. Please request a new one.";
      case "invalid-verification-id":
        return "The verification ID is invalid. Please request a new verification code.";
      case "requires-recent-login":
        return "This operation is sensitive and requires recent authentication. Please log in again.";
      case "invalid-phone-number":
        return "The phone number is invalid. Please enter a valid phone number.";
      case "phone-number-already-exists":
        return "This phone number is already in use by another account.";
      case "quota-exceeded":
        return "The SMS quota for this project has been exceeded.";
      case "credential-already-in-use":
        return "This credential is already associated with a different user account.";
      case "id-token-expired":
        return "Your login session has expired. Please sign in again.";
      case "id-token-revoked":
        return "Your login session has been revoked. Please sign in again.";
      case "session-cookie-expired":
        return "Your session cookie has expired. Please sign in again.";
      case "session-cookie-revoked":
        return "Your session cookie has been revoked. Please sign in again.";
      case "internal-error":
        return "An internal error occurred. Please try again later.";
      case "app-not-authorized":
        return "This app is not authorized to use Firebase Authentication.";
      case "app-not-installed":
        return "The required app is not installed on your device.";
      case "invalid-api-key":
        return "There's a problem with our authentication service. Please try again later.";
      case "network-request-failed":
        return "A network error occurred. Please check your internet connection.";
      case "expired-action-code":
        return "The action code has expired. Please request a new one.";
      case "invalid-action-code":
        return "The action code is invalid. Please check the link or request a new one.";
      case "missing-action-code":
        return "The action code is missing. Please check the link and try again.";
      case "user-disabled":
        return "This account has been disabled. Please contact support for help.";
      case "user-mismatch":
        return "The provided credentials don't match the current user.";
      case "user-token-expired":
        return "Your login session has expired. Please sign in again.";
      default:
        return "An unexpected authentication error occurred. Please try again.";
    }
  }
}