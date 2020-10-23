part of './bloc.dart';

abstract class RegisterEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class CheckRegister extends RegisterEvent {
  final User user;
  CheckRegister({this.user});

  @override
  List<User> get props => [user];

}