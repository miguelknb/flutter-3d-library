// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'flutterfire.dart';
import 'postPage.dart';

import 'model.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  void showAlert(String message) {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
      title: Text("Error"),
      content: Text(message),
    );

    }); 
    
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: _emailField,
              decoration: InputDecoration(
                  hintText: "nome@email.com",
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  )),
            ),
            TextFormField(
              controller: _passwordField,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "password",
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  )),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: MaterialButton(
                onPressed: () async {
                  RegisterResponse response =
                      await register(_emailField.text, _passwordField.text);
                  if (response.completed == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostPage(model: cubo),
                      ),
                    );
                  } else {
                    showAlert(response.message);
                  }
                },
                child: Text("Register"),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: MaterialButton(
                onPressed: () async {
                  SignInResponse response =
                      await signIn(_emailField.text, _passwordField.text);
                  if (response.completed) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostPage(model: cubo),
                      ),
                    );
                  } 
                  else {
                    showAlert(response.message);
                  }
                },
                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
