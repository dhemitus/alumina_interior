part of './bloc.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetProfile extends ProfileEvent {}
