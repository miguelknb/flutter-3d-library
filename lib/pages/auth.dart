// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter3d/pages/createProfile.dart';
import 'package:flutter3d/providers/auth_provider.dart';
import '../generated/l10n.dart';
import '../providers/auth_provider.dart';
import 'package:provider/provider.dart';
import '../showAlert.dart';
import 'home.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: _emailField,
                decoration: InputDecoration(
                    hintText: "nome@email.com",
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: _passwordField,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "************",
                    labelText: S.of(context).password,
                    labelStyle: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: MaterialButton(
                onPressed: () async {
                  AuthResponse response = await ap.register(
                      _emailField.text, _passwordField.text, S.of(context));
                  if (response.completed == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateProfile(),
                      ),
                    );
                  } else {
                    showAlert(context, response.message);
                  }
                },
                child: Text(S.of(context).register),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: MaterialButton(
                onPressed: () async {
                  AuthResponse response = await ap.signIn(
                      _emailField.text, _passwordField.text, S.of(context));
                  if (response.completed) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ap.user?.displayName != null
                            ? ListModels()
                            : CreateProfile(),
                      ),
                    );
                  } else {
                    showAlert(context, response.message);
                  }
                },
                child: Text(S.of(context).login),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
