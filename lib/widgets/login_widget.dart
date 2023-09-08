import 'package:flutter/material.dart';
import 'package:flutter_evaluation_axel_huon/pages/user_information.dart';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}
class _FormLoginState extends State<FormLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Ajoutez une clé de formulaire

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form( // Entourez votre contenu avec le widget Form
          key: _formKey, // Utilisez la clé de formulaire
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/image.jpg',
                width: 100,
                height: 300,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) { // Vérifiez la validité du formulaire
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserInformationPage(
                          username: _usernameController.text,
                          password: _passwordController.text,
                        ),
                      ),
                    );
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        );
  }
}