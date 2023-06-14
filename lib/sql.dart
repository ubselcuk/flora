import 'package:postgres/postgres.dart';

db(String q) async {
  var connection = PostgreSQLConnection('185.136.206.253', 5432, 'flora',
      queryTimeoutInSeconds: 3600,
      timeoutInSeconds: 3600,
      username: 'postgres',
      password: 'password');
  await connection.open();
  List<List<dynamic>> results = await connection.query(q);

  //var results = await connection.query(q);
  return results;
}
