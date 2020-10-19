part of './bloc.dart';

abstract class InitEvent extends Equatable {

  @override
  List<bool> get props => [];
}

class StartInit extends InitEvent {}