import 'package:bloc/bloc.dart';
import 'package:bloc_rest_api/data/contact_repository.dart';
import 'package:bloc_rest_api/data/model/contact.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'editcontact_state.dart';
@injectable
class EditContactCubit extends Cubit<EditContactState> {
  final ContactRepository _contactRepository;
  EditContactCubit(this._contactRepository) : super(EditContactInitial());
  void edit(String id,Contact contact){
    emit(EditContactLoading());
    _contactRepository.updateContact(id, contact)
    .then((value) => emit(EditContactSuccess()))
    .catchError((e) => emit(EditContactFail('Error')));
  }
}
