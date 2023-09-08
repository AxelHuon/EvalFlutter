import '../model/user_model.dart';
import '../database_connetion/database_connection.dart';


class UserRepository {

  final DatabaseHelper _dbHelper;
  UserRepository(this._dbHelper);

  Future<dynamic> insertUser(User user) async {
    final conn = await _dbHelper.conn;
    final result = await conn.query(
      'INSERT INTO user (userName, password, idApp) VALUES (?, ?, ?)',
      [user.userName, user.userPassword, user.idApp],
    );
    return result;
  }


  Future<dynamic> updateUser(User user) async {
    final conn = await _dbHelper.conn;
    final result = await conn.query(
      'UPDATE user SET userName = ?, password = ? WHERE idApp = ?',
      [user.userName, user.userPassword, user.idApp],
    );
    return result;
  }

}