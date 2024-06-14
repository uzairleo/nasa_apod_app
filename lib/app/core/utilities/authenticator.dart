class Authenticator {
  String? _idToken;

  void setIdToken(String? token) {
    _idToken = token;
  }

  resetUser() {
    _idToken = null;
  }

  String? getIdToken() {
    if (_idToken != null) {
      return _idToken;
    } else {
      return null;
    }
  }
}
