import 'package:bloc_rest_api/data/model/contact.dart';
import 'package:floor/floor.dart';

@dao
abstract class ContactDao {

  @insert
  Future<void> addContact(Contact contact);

  @Query('select * from contact')
  Stream<List<Contact>> getContact();

  @Query('select * from contact where id = :id')
  Future<List<Contact>> getContactById(String id);


}