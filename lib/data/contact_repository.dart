import 'package:bloc_rest_api/data/model/contact.dart';

abstract class ContactRepository{
  Future<List<Contact>> getContact();

  Future<Contact> addContact(Contact contact);

  Future<Contact> editContact(String id,Contact contact);

  Future<Contact> deleteContact(String id);


}