
import 'package:flutter/material.dart';
import 'package:flutter_evaluation_axel_huon/pages/login_page.dart';
import 'edit_user_page.dart';
import '../database_connetion/database_connection.dart';
import '../model/user_model.dart';
import '../repository/user_repository.dart';



class UserInformationPage extends StatefulWidget {
  final String username;
  final String password;
  final int? userID;

  UserInformationPage({required this.username, required this.password, this.userID});

  @override
  _UserInformationPageState createState() => _UserInformationPageState();
}




class _UserInformationPageState extends State<UserInformationPage> {
  late int userID;
  late DatabaseHelper dbHelper;
  late UserRepository userRepository;

  void generateUserID() {
    userID = widget.userID ?? DateTime.now().millisecondsSinceEpoch;
  }

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper();
    userRepository = UserRepository(dbHelper);
    generateUserID();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Information')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('User ID: $userID'),
            SizedBox(height: 16),
            Text('Username: ${widget.username}'),
            SizedBox(height: 16),
            Text('Password: ${widget.password}'),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final newUser = User(
                      userID: 0,
                      userName: widget.username,
                      userPassword: widget.password,
                      idApp: userID,
                    );

                    final result = await userRepository.insertUser(newUser);
                  },
                  child: Text('Enregistrer'),
                ),
                ElevatedButton(
                  onPressed: () async {

                    final newUser = User(
                      userID: 0,
                      userName: widget.username,
                      userPassword: widget.password,
                      idApp: userID,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditUserPage(
                          username: newUser.userName,
                          password: newUser.userPassword, idApp: newUser.idApp,
                        ),
                      ),
                    );                  },
                  child: Text('Modifier'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(
                        ),
                      ),
                    );                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}