import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_app/widgets/widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

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
  bool _showSpinner = false;

  void _register() async {
    try {
      final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text))
          .user;
      if (user != null) {
        setState(() {
          _userEmail = user.email;
        });
        Navigator.of(context).pushNamed('/login');
      } else {
        print("Error");
      }
      setState(() {
        _showSpinner = false;
      });
    } catch (e) {
      print(e);
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
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Form(
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
                            setState(() {
                              _showSpinner = true;
                            });
                            if (_formKey.currentState.validate()) {
                              _register();
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
      ),
    );
  }
}
