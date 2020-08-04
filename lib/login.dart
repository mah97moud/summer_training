import 'package:flutter/material.dart';
import 'package:new_app/services/login_with_google.dart';

import 'create-account.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    radius: 90,
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              buildTextField("Username", false),
              SizedBox(
                height: 20,
              ),
              buildTextField("Password", true),
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
                            builder: (BuildContext context) => CreateAccount(),
                          ),
                        );
                      },
                    ),
                    RaisedButton(
                      child: Text("Sign In"),
                      onPressed: () {
                        Navigator.pop(context);
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
    );
  }

  Widget buildButtonBar() {
    return Column(
      children: <Widget>[
        Text(
          "Or Login With",
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
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: FloatingActionButton(
                heroTag: 'facebook',
                onPressed: () {
                  print("Facebook Account");
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/facebook.png"),
                  radius: 30,
                  backgroundColor: Colors.transparent,
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: FloatingActionButton(
                heroTag: 'twitter',
                onPressed: () {
                  print("Twitter Account");
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/twitter.png"),
                  radius: 30,
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

Widget buildTextField(String text, bool isPassword) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: TextField(
      textAlign: TextAlign.left,
      maxLines: 1,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          left: 30,
        ),
        filled: true,
        labelText: text,
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
      obscureText: isPassword,
    ),
  );
}
