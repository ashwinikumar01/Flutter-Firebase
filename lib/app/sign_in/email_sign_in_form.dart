import 'package:flutter/material.dart';
import 'package:time_tracker_app/common_widgets/form_submit_button.dart';

class EmailSignInForm extends StatelessWidget {
  List<Widget> _buildChildren() {
    return [
      Flexible(
        child: TextField(
          decoration:
              InputDecoration(labelText: 'Email', hintText: 'test@test.com'),
        ),
      ),
      SizedBox(
        height: 8.0,
      ),
      TextField(
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: '11111',
        ),
        obscureText: true,
      ),
      SizedBox(
        height: 30.0,
      ),
      FormSubmitButton(text: 'Sign In', onPressed: () {}),
      SizedBox(
        height: 8.0,
      ),
      FlatButton(
        child: Text('Need an account? Register'),
        onPressed: () {},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }
}
