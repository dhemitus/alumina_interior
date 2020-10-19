part of './bloc.dart';

abstract class InitState extends Equatable {
  const InitState();
}

class InitInitial extends InitState {
  const InitInitial();

  @override
  List<bool>  get props => [];
}

class InitLoading extends InitState {
  const InitLoading();

  @override
  List<bool>  get props => [];
}

class InitLoaded extends InitState {
  final bool init;
  const InitLoaded(this.init);

  @override
  List<bool>  get props => [init];
}

class InitError extends InitState {
  final String message;
  const InitError(this.message);

  @override
  List<String>  get props => [message];
}