import 'package:bloc_rest_api/data/model/contact.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'apiservice.g.dart';

@RestApi(baseUrl :'https://5f8864c8a8a2b5001641eb74.mockapi.io/api/')
abstract class ApiService{
 factory ApiService(Dio dio) =>  _ApiService(dio);

 @GET('')
 Future<List<Contact>> getContact();

 @POST('')
 Future<Contact> addContact(@Body() Contact contact);

 @PUT('{id}')
 Future<Contact> updateContact(@Path()String id,@Body() Contact contact);

 @DELETE('{id}')
 Future<Contact> deleteContct(@Path() String id);

}