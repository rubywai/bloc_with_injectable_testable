part of 'editcontact_cubit.dart';

abstract class EditContactState extends Equatable {
  const EditContactState();

  @override
  List<Object> get props => [];
}

class EditContactInitial extends EditContactState {}

class EditContactLoading extends EditContactState{}
class EditContactSuccess extends EditContactState{}
class EditContactFail extends EditContactState{
  final String error;

  EditContactFail(this.error);
  @override
  List<Object> get props => [error];
}