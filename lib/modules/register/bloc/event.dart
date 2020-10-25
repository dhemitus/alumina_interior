part of './bloc.dart';

abstract class RegisterEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class IsRegisterd extends RegisterEvent {}

class AddRegister extends RegisterEvent {
  final User user;
  AddRegister(this.user);

  @override
  List<User> get props => [user];

}