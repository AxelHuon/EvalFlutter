import 'package:flutter/material.dart';
import 'package:flutter_evaluation_axel_huon/pages/user_information.dart';
import 'package:flutter_evaluation_axel_huon/widgets/login_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Ajoutez une clé de formulaire

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormLogin(),
      ),
    );
  }
}