import 'package:flutter_sqlite/contact.dart';
import 'package:flutter_sqlite/databaseprovider.dart';
import 'package:sqflite/sqflite.dart';

class ContactDataAccess {
  getAll() async {
    final db = await DatabaseProvider.db.database;
    var results = await db.query("Contact");
    var list = results.map((e) => Contact.fromMap(e)).toList();
    return list;
  }

  getByUd(int id) async {
    final db = await DatabaseProvider.db.database;
    var results = await db.query("Contact", where: "id= ?", whereArgs: [id]);
    var contact = results.isNotEmpty ? Contact.fromMap(results.first) : null;
    return contact;
  }

  insert(Contact contact) async {
    final db = await DatabaseProvider.db.database;
    var result = await db.insert("Contact",
        {"name": contact.name, "email": contact.email, "phone": contact.phone},
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  update(Contact contact) {}

  delete(int id) {}

  deleteAll() {}
}
