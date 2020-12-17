import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_rest_api/data/contact_repository.dart';
import 'package:bloc_rest_api/data/model/contact.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

part 'postcontact_state.dart';
@injectable
class PostcontactCubit extends Cubit<PostcontactState> {
  final ContactRepository _contactRepository;
  PostcontactCubit(this._contactRepository) : super(PostcontactInitial());


  void addContact(Contact contact){
    emit(PostcontactLodinng());
    _contactRepository.addContact(contact)
    .then((value) => emit(PostcontactSuccess()))
    .catchError((e) => emit(PostcontactFail('Error')));
  }

  @override
  Future<void> close() {
    print('close');
    return super.close();

  }
}
