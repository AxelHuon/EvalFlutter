import 'package:flutter/material.dart';
import 'package:flutter_evaluation_axel_huon/pages/user_information.dart';
import '../database_connetion/database_connection.dart';
import '../model/user_model.dart';
import '../repository/user_repository.dart';


class FormEditUser extends StatefulWidget {
  final int idApp; // Ajoutez cette ligne pour déclarer idApp en tant que propriété
  final String username; // Ajoutez cette ligne pour déclarer idApp en tant que propriété
  final String password; // Ajoutez cette ligne pour déclarer idApp en tant que propriété

  FormEditUser({required this.idApp,required this.username, required this.password}); // Ajoutez ce constructeur

  @override
  _FormEditUserState createState() => _FormEditUserState();
}
class _FormEditUserState extends State<FormEditUser> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Ajoutez une clé de formulaire
  late DatabaseHelper dbHelper;
  late UserRepository userRepository;

  late TextEditingController _usernameController = TextEditingController(text: widget.username);
  late TextEditingController _passwordController = TextEditingController(text: widget.password);

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper();
    userRepository = UserRepository(dbHelper);
    _usernameController = TextEditingController(text: widget.username);
    _passwordController = TextEditingController(text: widget.password);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Form( // Entourez votre contenu avec le widget Form
      key: _formKey, // Utilisez la clé de formulaire
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
            onPressed: () async {
              if (_formKey.currentState!.validate()) { // Vérifiez la validité du formulaire
                final newUser = User(
                  userID: 0, // ou une autre valeur si nécessaire
                  userName: _usernameController.text,
                  userPassword: _passwordController.text,
                  idApp: widget.idApp,
                );

                // Assurez-vous que la méthode updateUser soit bien définie dans votre UserRepository
                final result = await userRepository.updateUser(newUser);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserInformationPage(
                      username: newUser.userName,
                      password: newUser.userPassword,
                      userID: widget.idApp,
                    ),
                  ),
                );
              }
            },
            child: Text('Modifier'),
          ),
        ],
      ),
    );
  }
}