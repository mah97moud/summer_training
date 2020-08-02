import 'package:flutter/material.dart';

import 'login.dart';

class CreateAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[],
        backgroundColor: Colors.orange[400],
      ),
      body: Container(
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
                    tag: 'create',
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
              buildTextField("Username", false),
              SizedBox(
                height: 5.0,
              ),
              buildTextField("Email", false),
              SizedBox(
                height: 5.0,
              ),
              buildTextField("Password", true),
              SizedBox(
                height: 5.0,
              ),
              buildTextField("Confirm Password", true),
              SizedBox(
                height: 5.0,
              ),
              ButtonBar(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 90.0),
                    child: RaisedButton(
                      onPressed: () {
                        print("Create new Account");
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
    );
  }
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
                print("Google Account");
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
