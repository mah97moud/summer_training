import 'package:flutter/material.dart';
import 'package:new_app/home.dart';
import 'package:new_app/services/login_with_google.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      left: 30,
                    ),
                    filled: true,
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(117, 117, 117, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: "Segoe",
                    ),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100.0),
                      ),
                    ),
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please Enter Email';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      left: 30,
                    ),
                    filled: true,
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(117, 117, 117, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: "Segoe",
                    ),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100.0),
                      ),
                    ),
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please Enter password';
                    }
                    return null;
                  },
                ),
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
                                return HomePage();
                              }));
                            }
                          }
                        },
                        child: Text("Create Account"),
                      ),
                    ),
                  ],
                ),
                buildButtonBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButtonBar() {
    return Column(
      children: <Widget>[
        Text(
          "Login With",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25.0, color: Colors.deepOrange),
        ),
        SizedBox(
          height: 10,
        ),
        ButtonBar(
          mainAxisSize: MainAxisSize.min,
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: FloatingActionButton(
                heroTag: 'google',
                onPressed: () {
                  signInWithGoogle().whenComplete(() => {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return HomePage();
                        }))
                      });
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/google.png"),
                  radius: 20,
                  backgroundColor: Colors.transparent,
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
