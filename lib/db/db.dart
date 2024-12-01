import 'package:mysql_client/mysql_client.dart';
import 'package:http/http.dart' as http;
import 'package:mysql1/mysql1.dart';

Future<void> main() async {
final conn = await MySqlConnection.connect(ConnectionSettings(

    host: 'localhost',

    port: 3306,

    user: 'root',

    password: 'Dibat2009',

    db: 'practice_app'

));

final result = await conn.query('SELECT * FROM practice_app.practice_log');


for (var row in result) {

    print('Name: ${row['idpractice_log']}, Email: ${row['time']}, Instrument: ${row['instrument']}, Genre: ${row['genre']}');

}
}

