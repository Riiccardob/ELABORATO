import 'package:google_sign_in/google_sign_in.dart';
// keytool -genkey -v -keystore ~/mykey.jks -keyalg RSA -keysize 2048 -validity 10000 -alias androiddebugkey

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount> login() => _googleSignIn.signIn();

  static Future<GoogleSignInAccount> logout() => _googleSignIn.disconnect();
}
