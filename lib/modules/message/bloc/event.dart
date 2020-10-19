part of './bloc.dart';

abstract class MessageEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class StartMessage extends MessageEvent {}