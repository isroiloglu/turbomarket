import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../Helper/alertMessage.dart';

class SocialLoginHandler{
  final googleLogin = GoogleSignIn();
  final facebookLogin = FacebookLogin();
  AuthProvider provider = AuthProvider.none;

  Future<GoogleSignInAccount?> handleGoogleSignIn(BuildContext context) async {
    try {
      var data = await googleLogin.signIn();
      provider = AuthProvider.gmail;
      return data;
    } catch (error, stk) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AlertMessage.showWarning(error.toString(), context);
      });
      if (kDebugMode) {
        print(stk);
      }
      return null;
    }
  }

  Future<FacebookLoginResult?> handleFacebookSignIn(BuildContext context) async {
    try {
      var result = await facebookLogin.logIn(permissions: [
        FacebookPermission.email,
      ]);
      print(result.status);
      print(await facebookLogin.accessToken);
      if ((await facebookLogin.isLoggedIn)) {
        print(await facebookLogin.getUserEmail());
      }
      provider = AuthProvider.facebook;
      return result;
    } catch (error, stk) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AlertMessage.showWarning(error.toString(), context);
      });
      print(stk);
      return null;
    }
  }

  void signOut() async {
    switch (provider) {
      case AuthProvider.facebook:
        facebookLogin.logOut();
        break;
      case AuthProvider.gmail:
        googleLogin.signOut();
        break;
      default:
        break;
    }
  }
}

enum AuthProvider { facebook, gmail, none }

final socialLoginHandler = SocialLoginHandler();