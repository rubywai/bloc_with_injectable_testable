import 'package:bloc_rest_api/data/model/contact.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

import 'contact_dao.dart';
part 'contact_database.g.dart';
@Database(version: 1,entities: [Contact] )
abstract class ContactDatabase extends FloorDatabase{
  ContactDao get dao;
}