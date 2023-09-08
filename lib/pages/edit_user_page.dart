import 'package:flutter/material.dart';
import 'package:flutter_evaluation_axel_huon/widgets/form_edit_user_widget.dart';
import '../repository/user_repository.dart';
import '../database_connetion/database_connection.dart';

class EditUserPage extends StatefulWidget {
  final String username;
  final String password;
  final int idApp;

  EditUserPage({required this.username, required this.password, required this.idApp});

  @override
  _EditUserPageState createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {

  late DatabaseHelper dbHelper;
  late UserRepository userRepository;


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Ajoutez une clé de formulaire


  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper();
    userRepository = UserRepository(dbHelper);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit User Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormEditUser(idApp: widget.idApp, username: widget.username,password: widget.password)
      ),
    );
  }
}