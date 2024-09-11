import 'package:flutter/material.dart';
import 'package:twitter/twitter-form.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Container(
            color: Colors.blue,
            alignment: Alignment.centerLeft,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                  child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            LoginForm(),
          ],
        )
    );
  }
}