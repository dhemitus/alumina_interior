part of './bloc.dart';

abstract class InitEvent extends Equatable {
  const InitEvent();
}

class StartInit extends InitEvent {
  StartInit();

  @override
  List<bool> get props => [];
}