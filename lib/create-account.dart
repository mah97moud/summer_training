import 'package:flutter/material.dart';
import 'package:new_app/home.dart';
import 'package:new_app/services/login_with_google.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_app/widgets/widgets.dart';

import 'colors.dart';
import 'login.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;

  void _register() async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = true;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[],
        backgroundColor: Colors.orange[400],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bg.png"), fit: BoxFit.cover),
          ),
          child: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              children: <Widget>[
                SizedBox(
                  height: 5.0,
                ),
                Column(
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: CircleAvatar(
                        backgroundImage: AssetImage("images/logo.png"),
                        radius: 90,
                        backgroundColor: Colors.transparent,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                buildFormFile('email', _emailController, false, Icons.email),
                SizedBox(
                  height: 5.0,
                ),
                buildFormFile(
                    'password', _passwordController, true, Icons.lock),
                SizedBox(
                  height: 5.0,
                ),
                ButtonBar(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 90.0),
                      child: RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            _register();
                            if (_success) {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return LoginPage();
                              }));
                            }
                          }
                        },
                        child: Text("Create Account"),
                      ),
                    ),
                  ],
                ),
                buildButtonBar(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
