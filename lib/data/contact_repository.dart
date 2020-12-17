import 'package:bloc_rest_api/data/api/apiservice.dart';
import 'package:bloc_rest_api/data/model/contact.dart';
import 'package:injectable/injectable.dart';
@injectable
@lazySingleton
class ContactRepository{
  final ApiService _apiService;

  ContactRepository(this._apiService);

  Future<List<Contact>> getContact() => _apiService.getContact();

  Future<Contact> addContact(Contact contact) => _apiService.addContact(contact);

  Future<Contact> updateContact(String id,Contact contact) => _apiService.updateContact(id, contact);

  Future<Contact> deleteContact(String id) => _apiService.deleteContct(id);
}