part of './bloc.dart';

abstract class MessageState extends Equatable {
  const MessageState();
}

class MessageInitial extends MessageState {
  const MessageInitial();

  @override
  List<Object>  get props => [];
}

class MessageLoading extends MessageState {
  const MessageLoading();

  @override
  List<Object>  get props => [];
}

class MessageLoaded extends MessageState {

  @override
  List<Object>  get props => [];
}

class MessageError extends MessageState {
  final String message;
  const MessageError(this.message);

  @override
  List<String>  get props => [message];
}