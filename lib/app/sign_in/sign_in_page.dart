import 'package:flutter/material.dart';
import 'package:time_tracker_app/app/sign_in/sign_in_button.dart';
import 'package:time_tracker_app/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker_app/services/auth.dart';

class SignInPage extends StatelessWidget {
  // creates a method for signing anonomously
  SignInPage({@required this.auth, @required this.onSignIn});
  final Function(User) onSignIn; // argument-FirebaseUser
  final AuthBase auth;

  Future<void> _signInAnonymously() async {
    try {
      User user = await auth.signInAnonymously();
      onSignIn(user);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Time Tracker App'),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 48.0),
          SocialSignInButton(
            assetName: 'assets/google-logo.png',
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: () {},
          ),
          SizedBox(height: 9.0),
          SocialSignInButton(
            assetName: 'assets/facebook-logo.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            onPressed: () {},
            color: Color(0xFF334D92),
          ),
          SizedBox(height: 9.0),
          SocialSignInButton(
            assetName: 'assets/email.png',
            text: 'Sign in with email',
            textColor: Colors.white,
            onPressed: () {},
            color: Colors.teal[700],
          ),
          SizedBox(height: 9.0),
          Text(
            'or',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black87, fontSize: 25.0),
          ),
          SizedBox(height: 9.0),
          SignInButton(
            text: 'Go anonymous',
            textColor: Colors.black87,
            onPressed: () {
              _signInAnonymously(); // we can use a fat hand arrow too
            },
            color: Colors.lime[300],
          ),
        ],
      ),
    );
  }
}
