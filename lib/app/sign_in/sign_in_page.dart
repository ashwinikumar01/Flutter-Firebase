import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_app/app/sign_in/email_sign_in_page.dart';
import 'package:time_tracker_app/app/sign_in/sign_in_button.dart';
import 'package:time_tracker_app/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker_app/common_widgets/platform_exception_alert_dialog.dart';
import 'package:time_tracker_app/services/auth.dart';

class SignInPage extends StatelessWidget {
  // creates a method for signing anonomously

  void _showSignInError(BuildContext context, PlatformException exception) {
    PlatformExceptionAlertDialog(title: 'Sign in failed', exception: exception)
        .show(context);
  }

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context);
      await auth.signInAnonymously();
    } on PlatformException catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSignInError(context, e);
      }
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context);

      await auth.signInWithGoogle();
    } on PlatformException catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSignInError(context, e);
      }
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context);

      await auth.signInWithFacebook();
    } on PlatformException catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSignInError(context, e);
      }
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Time Tracker App'),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
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
            onPressed: () {
              _signInWithGoogle(context);
            },
          ),
          SizedBox(height: 9.0),
          SocialSignInButton(
            assetName: 'assets/facebook-logo.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            onPressed: () {
              _signInWithFacebook(context);
            },
            color: Color(0xFF334D92),
          ),
          SizedBox(height: 9.0),
          SocialSignInButton(
            assetName: 'assets/email.png',
            text: 'Sign in with email',
            textColor: Colors.white,
            onPressed: () {
              _signInWithEmail(context);
            },
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
              _signInAnonymously(context); // we can use a fat hand arrow too
            },
            color: Colors.lime[300],
          ),
        ],
      ),
    );
  }
}
