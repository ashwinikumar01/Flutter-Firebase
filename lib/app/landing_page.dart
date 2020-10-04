import 'package:flutter/material.dart';
import 'package:time_tracker_app/app/home_page.dart';
import 'package:time_tracker_app/app/sign_in/sign_in_page.dart';
import 'package:time_tracker_app/services/auth.dart';

class LandingPage extends StatelessWidget {
  LandingPage({@required this.auth});
  final AuthBase auth;

  // User _user; // variable

  // @override
  // void initState() {
  //   super.initState();
  //   _checkCurrentUser();
  //   widget.auth.onAuthStateChanged.listen((user) {
  //     // stream
  //     print('user: ${user?.uid}');
  //   });
  // }

  // Future<void> _checkCurrentUser() async {
  //   User user = await widget.auth.currentUser();
  //   _updateUser(user);
  // }

  // void _updateUser(User user) {
  //   setState(() {
  //     _user = user;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            // at the time of landing page user is null and then we will sign in
            User user = snapshot.data; // variable
            if (user == null) {
              return SignInPage(
                auth: auth,
              );
            }
            return HomePage(
              auth: auth,
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
