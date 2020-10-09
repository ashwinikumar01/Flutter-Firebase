import 'package:flutter/material.dart';

class EmailSignInPage extends StatelessWidget {
  const EmailSignInPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(child: _buildContent()),
      ),
    );
  }

  Widget _buildContent() {
    return Container();
  }
}
