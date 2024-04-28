part of 'chat_cubit.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatSendMessageSuccessState extends ChatState {}

class ChatSendMessageErrorState extends ChatState {
  final dynamic error;
  ChatSendMessageErrorState(this.error);
}

class ChatGetMessageLoadingState extends ChatState {}

class ChatGetMessageSuccessState extends ChatState {}

class ChatGetMessageErrorState extends ChatState {
  final dynamic error;
  ChatGetMessageErrorState(this.error);
}
