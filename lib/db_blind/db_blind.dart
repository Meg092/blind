import 'package:blind_box/db_blind/blind_entity.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBBlind extends GetxService {
  late Database dbBase;

  Future<DBBlind> init() async {
    await createBlindDB();
    return this;
  }

  createBlindDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'blind.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await createBlindTable(db);
    });
  }

  createBlindTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS blind (id INTEGER PRIMARY KEY, createdTime TEXT, image BLOB, brandInformation TEXT, star INTEGER, hiddenVersion INTEGER, mark TEXT)');
  }

  insertBlind(BlindEntity entity) async {
    final id = await dbBase.insert('blind', {
      'createdTime': entity.createdTime.toIso8601String(),
      'image': entity.image,
      'brandInformation': entity.brandInformation,
      'star': entity.star,
      'hiddenVersion': entity.hiddenVersion,
      'mark': entity.mark,
    });
    return id;
  }

  deleteBlind(int id) async {
    await dbBase.delete('blind', where: 'id = ?', whereArgs: [id]);
  }

  cleanBlindData() async {
    await dbBase.delete('blind');
  }

  Future<List<BlindEntity>> getBlindAllData() async {
    var result = await dbBase.query('blind', orderBy: 'createdTime DESC');
    return result.map((e) => BlindEntity.fromJson(e)).toList();
  }
}
