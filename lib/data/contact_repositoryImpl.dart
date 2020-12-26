import 'package:bloc_rest_api/data/api/apiservice.dart';
import 'package:bloc_rest_api/data/model/contact.dart';
import 'package:injectable/injectable.dart';

import 'contact_repository.dart';
@Injectable(as : ContactRepository)
@lazySingleton
class ContactRepositoryImpl extends ContactRepository{
  final ApiService _apiService;

  ContactRepositoryImpl(this._apiService);
  @override
  Future<List<Contact>> getContact() => _apiService.getContact();
  @override
  Future<Contact> addContact(Contact contact) => _apiService.addContact(contact);
  @override
  Future<Contact> editContact(String id,Contact contact) => _apiService.updateContact(id, contact);
  @override
  Future<Contact> deleteContact(String id) => _apiService.deleteContct(id);
}