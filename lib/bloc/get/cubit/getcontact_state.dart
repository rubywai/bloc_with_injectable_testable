part of 'getcontact_cubit.dart';

abstract class GetContactState extends Equatable {
  const GetContactState();

  @override
  List<Object> get props => [];
}

class GetContactInitial extends GetContactState {}

class GetContactSuccess extends GetContactState{
  final List<Contact> contacts;

  GetContactSuccess(this.contacts);
  @override
  // TODO: implement props
  List<Object> get props => [contacts];
}

class GetContactFail extends GetContactState{
  final String error;

  GetContactFail(this.error);
  @override
  // TODO: implement props
  List<Object> get props => [error];
}
