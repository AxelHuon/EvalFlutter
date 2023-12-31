import 'package:mysql1/mysql1.dart';

class DatabaseHelper {
  MySqlConnection? _conn;

  Future<MySqlConnection> get conn async {
    if (_conn == null) {
      try {
        final settings = ConnectionSettings(
          host: '10.0.2.2',
          port: 8889,
          user: 'root',
          db: 'dbevalflutter',
          password: 'root',
        );
        _conn = await MySqlConnection.connect(settings);
      } catch (e) {
        print("Erreur lors de la connexion à la base de données: $e");
      }
    }
    return _conn!;
  }
}

