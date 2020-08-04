import 'package:flutter/material.dart';
import 'package:new_app/colors.dart';
import 'package:new_app/entering_course/second_home.dart';
import 'package:new_app/services/login_with_google.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'create-account.dart';
import 'home.dart';

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

  ChooseType _type = ChooseType.isCompany;
  void _signInWithEmailAndPassword() async {
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
    } else {
      setState(() {
        _success = false;
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
      body: Form(
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
                buildFormFile('email', _emailController, false),
                SizedBox(
                  height: 20,
                ),
                buildFormFile('password', _passwordController, true),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CreateAccount(),
                            ),
                          );
                        },
                      ),
                      RaisedButton(
                        child: Text("Sign In"),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            _signInWithEmailAndPassword();
                            if (_success) {
                              imageUrl =
                                  'https://scontent.fcai21-1.fna.fbcdn.net/v/t1.0-9/16196015_10154888128487744_6901111466535510271_n.png?_nc_cat=103&_nc_sid=09cbfe&_nc_ohc=fwASFdSqsjAAX9vvrkr&_nc_ht=scontent.fcai21-1.fna&oh=310408dea3df86cfd4e1c18a36f0987c&oe=5F4FC717';
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                switch (_type) {
                                  case ChooseType.isCompany:
                                    return SecondHome();
                                    break;
                                  case ChooseType.isStudent:
                                    return HomePage();
                                    break;
                                }
                              }));
                            }
                          }
                        },
                      ),
                    ],
                  ),
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

  Widget buildFormFile(
      String value, TextEditingController controller, bool securty) {
    return TextFormField(
      controller: controller,
      obscureText: securty,
      cursorColor: sSDarkRed,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          left: 30,
        ),
        filled: true,
        labelText: value,
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
          return 'Please enter your password';
        }
        return null;
      },
    );
  }
}
