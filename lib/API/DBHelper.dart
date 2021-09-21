import 'package:flutter/material.dart';
import 'package:grocery_app/Model/Product.dart';
import 'package:grocery_app/Model/User.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper
{
  static DBHelper _helper = null;
  DBHelper._getInstance();
  factory DBHelper(){
    if(_helper==null)
      _helper= DBHelper._getInstance();
    return _helper;
  }

  Database db;
  initializeDB()async{
    WidgetsFlutterBinding.ensureInitialized();
    final Future<Database> dtb= openDatabase(
      join(await getDatabasesPath(), 'Grocery.DB'),
      onCreate: (temp_db,ver){
        temp_db.execute('CREATE TABLE USER(email TEXT PRIMARY KEY, password TEXT, name TEXT)');
        temp_db.execute('CREATE TABLE ITEMS(ID INTEGER PRIMARY KEY,pName TEXT,pPrice INTEGER, pLocation TEXT,pQuantity INTEGER,pCount INTEGER,pDescription TEXT)');
      },
      version: 1,
    );
    db= await dtb;

  }
  void AddNewUser (User s) async{
    if(db==null) await initializeDB();
    db.insert('USER', s.ConvertToMap());
  }

  void AddNewItem (Product p) async{
    if(db==null) await initializeDB();
    db.insert('ITEMS', p.ConvertToMap());
  }

  Future <List<Map<String, dynamic>>> getBasketData()
  {
    if(db == null) initializeDB();
    return db.query('ITEMS'); // select all from course //ASC means ascending
  }

  Future <List<Map<String, dynamic>>> getUser()
  {
    if(db == null) initializeDB();
    return db.query('USER'); // select all from course //ASC means ascending
  }

  deleteData(int id)
  {
    if(db == null) initializeDB();
    db.delete('ITEMS',where:" ID =?",whereArgs: [id]);
  }


}