import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:login_design/db/model/ContactModel.dart';

class ContactsDatabase{
  static final ContactsDatabase instance = ContactsDatabase._init();
  static Database? _database;
  ContactsDatabase._init();

  Future<Database> get database async{
    if(_database != null) return _database!;
    _database = await _initDB("contacts.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,filePath);
    return await openDatabase(path,version: 1,onCreate: _createDB);
  }

  Future _createDB(Database db, int verson) async{
    final idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    final nameType = "TEXT";
    final phoneType = "TEXT NOT NULL";
    await db.execute('''
    CREATE TABLE ${tableContact} (
      ${ContactField.id} $idType,
      ${ContactField.name} $nameType,
      ${ContactField.phonenumber} $phoneType
    ) 
    ''');
  }

  Future<List<Contact>> getListContacts() async{
    final db = await instance.database;
    final rs = await db.rawQuery("SELECT * FROM $tableContact");
    return rs.map((json) => Contact.fromJson(json)).toList();
  }

  Future<Contact> addContact(Contact contact) async{
    final db = await instance.database;
    final newID = await db.insert(tableContact,contact.toJson());
    return contact.copy(id: newID);
  }

  Future<int> deleteContact(Contact contact) async{
    final db = await instance.database;
    return await db.delete(tableContact,where: "${ContactField.id} = ?",whereArgs: [contact.id]);
  }

  Future<int> updateContact(Contact contact) async{
    final db = await instance.database;
    return await db.update(tableContact, contact.toJson(),where: "${contact.id} = ?",whereArgs: [contact.id]);
  }

}