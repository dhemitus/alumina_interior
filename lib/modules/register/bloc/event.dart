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

//class GetProfile extends RegisterEvent {}

class SetPicture extends RegisterEvent {
  final UserData user;
  SetPicture(this.user);

  @override
  List<UserData> get props => [user];
}

class SetProfile extends RegisterEvent {
  final UserData user;
  SetProfile(this.user);

  @override
  List<UserData> get props => [user];
}

class SetAddress extends RegisterEvent {
  final UserData user;
  SetAddress(this.user);

  @override
  List<UserData> get props => [user];
}

class SetPhone extends RegisterEvent {
  final UserData user;
  SetPhone(this.user);

  @override
  List<UserData> get props => [user];
}
