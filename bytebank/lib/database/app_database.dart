import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:teste/dao/contacts_dao.dart';

Future<Database> getDatabase() async {
  // Caminho para o banco de dados e o nome do banco
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDao.tableSql);
    },
    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete, (caso queira fazer a limpeza tem que regredir uma versão)
  );
}

