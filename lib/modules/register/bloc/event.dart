part of './bloc.dart';

abstract class RegisterEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class CheckRegister extends RegisterEvent {
  final UserCredential user;
  CheckRegister({this.user});

  @override
  List<UserCredential> get props => [user];

}