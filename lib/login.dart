import 'package:flutter/material.dart';
import 'package:new_app/colors.dart';
import 'package:new_app/services/login_with_google.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_app/widgets/widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

enum ChooseType { isCompany, isStudent }

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;
  bool _showSpinner = false;

  ChooseType _type = ChooseType.isCompany;
  void _signInWithEmailAndPassword() async {
    try {
      final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      ))
          .user;

      if (user != null) {
        setState(() {
          _success = true;
          _userEmail = user.email;
        });
        imageUrl =
            'https://scontent.fcai21-1.fna.fbcdn.net/v/t1.0-9/16196015_10154888128487744_6901111466535510271_n.png?_nc_cat=103&_nc_sid=09cbfe&_nc_ohc=fwASFdSqsjAAX9vvrkr&_nc_ht=scontent.fcai21-1.fna&oh=310408dea3df86cfd4e1c18a36f0987c&oe=5F4FC717';
        name = _userEmail;
        switch (_type) {
          case ChooseType.isCompany:
            Navigator.of(context).pushNamed('/first');
            break;
          case ChooseType.isStudent:
            Navigator.of(context).pushNamed('/homePage');
            break;
        }
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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Form(
          key: _formKey,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                children: <Widget>[
                  SizedBox(
                    height: 80.0,
                  ),
                  Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage("images/logo.png"),
                        radius: 50,
                        backgroundColor: Colors.transparent,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  buildFormFile('email', _emailController, false, Icons.email),
                  SizedBox(
                    height: 20,
                  ),
                  buildFormFile(
                      'password', _passwordController, true, Icons.lock),
                  buildListTile('Company', ChooseType.isCompany),
                  buildListTile('Student', ChooseType.isStudent),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 15.0, 30.0, 0.0),
                    child: ButtonBar(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            "Create",
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/createAcount');
                          },
                        ),
                        RaisedButton(
                          child: Text("Sign In"),
                          onPressed: () async {
                            setState(() {
                              _showSpinner = true;
                            });
                            if (_formKey.currentState.validate()) {
                              _signInWithEmailAndPassword();
                            }
                          },
                        ),
                      ],
                    ),
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

  Widget buildListTile(String value, ChooseType chooseType) {
    return ListTile(
      title: Text(
        value,
        style: TextStyle(
          color: sSDarkRed,
          fontSize: 25.0,
          fontWeight: FontWeight.w800,
        ),
      ),
      leading: Radio(
        activeColor: sPrimaryOrange,
        value: chooseType,
        groupValue: _type,
        onChanged: (ChooseType value) {
          setState(() {
            _type = value;
          });
        },
      ),
    );
  }
}
