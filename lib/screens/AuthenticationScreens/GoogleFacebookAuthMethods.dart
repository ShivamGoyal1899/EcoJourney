import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String name = "Shivam Goyal";
String email = "hi@shivamgoyal.co";
String imageUrl = "https://avatars0.githubusercontent.com/u/25903939?s=460&v=4";

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;

  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);

  name = user.displayName;
  email = user.email;
  imageUrl = user.photoUrl;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  return 'signInWithGoogle succeeded: $user';
}

void signOutGoogle() async {
  await googleSignIn.signOut();
  print("User Sign Out");
}

var facebookLogin = FacebookLogin();

Future<String> initiateFacebookLogin() async {
  var facebookLoginResult =
      await facebookLogin.logInWithReadPermissions(['email']);

  switch (facebookLoginResult.status) {
    case FacebookLoginStatus.loggedIn:
      final token = facebookLoginResult.accessToken.token;
      final graphResponse = await http.get(
          'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.width(400)&access_token=$token');
      final profile = json.decode(graphResponse.body);

      print(profile.toString());
      name = profile['name'];
      email = profile['email'];
      imageUrl = profile['picture']['data']['url'];
      break;

    case FacebookLoginStatus.error:
      print('signInWithFacebook error');
      break;

    case FacebookLoginStatus.cancelledByUser:
      print('signInWithFacebook cancelled');
      break;
  }
  return 'signInWithFacebook succeeded';
}
