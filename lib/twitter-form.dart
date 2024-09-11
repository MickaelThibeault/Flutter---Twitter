import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _username = '';
  String _password = '';
  bool _saveInfo = false;
  final _formKey = GlobalKey<FormState>();
  String? _errorMessage;


  void _login() {
    if (!_formKey.currentState!.validate()) {
      print('Formulaire invalide');
      // if (_username != 'admin' || _password != 'adminadmin') {
      //   setState(() {
      //     _errorMessage = 'Identifiant ou mot de passe incorrect';
      //   });
      // } else {
      //   setState(() {
      //     _errorMessage = null;
      //   });
      //   // Logique de connexion
      // }
    } else {
      Navigator.pushNamed(context, '/tweet-list-page');
    }
  }

  String? validateIdentifiant(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre identifiant';
    }
    if (value.length < 3) {
      return 'L\'identifiant doit contenir au moins 3 caractères';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre mot de passe';
    }
    if (value.length < 6) {
      return 'Le mot de passe doit contenir au moins 6 caractères';
    }
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Le mot de passe doit contenir au moins un caractère spécial';
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text("Connexion à Twitter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Identifiant',
                  hintText: 'Entrez votre identifiant'),
              validator: validateIdentifiant,
              onChanged: (value) {
                setState(() {
                  _username = value;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Mot de passe',
                  hintText: 'Entrez votre mot de passe'),
              obscureText: true,
              validator: validatePassword,
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            if (_errorMessage != null) ...[
              const SizedBox(height: 10),
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),
            ],
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Row(
                children: [
                  Switch(
                    value: _saveInfo,
                    onChanged: (value) {
                      setState(() {
                        _saveInfo = value;
                      });
                    },
                  ),
                  const Text('Mémoriser mes informations'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Connexion'),
            ),
          ],
        ),
      ),
    );
  }
}