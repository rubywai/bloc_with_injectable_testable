import 'package:bloc_rest_api/data/api/apiservice.dart';
import 'package:bloc_rest_api/data/database/contact_dao.dart';
import 'package:bloc_rest_api/data/database/contact_database.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:bloc_rest_api/di/injection.config.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<GetIt> configureDependencies() async => await $initGetIt(getIt);



@module
abstract class ContactModule{
  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  ApiService  apiService(@injectable Dio dio, @injectable LogInterceptor logInterceptor){
    //dio.interceptors.add(logInterceptor);
    return ApiService(dio);
  }

  @lazySingleton
  @preResolve
  Future<ContactDatabase> get contactDatabase =>
      $FloorContactDatabase.databaseBuilder('contact.db').build();

  @lazySingleton
  ContactDao contactDao(@injectable ContactDatabase contactDatabase)  {
    ContactDatabase contactDB =  contactDatabase;
    return contactDB.dao;
  }

  @lazySingleton
  Future<SharedPreferences> get share => SharedPreferences.getInstance();

  @lazySingleton
  LogInterceptor get loggingInter => LogInterceptor(requestBody: true);



}

