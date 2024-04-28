import 'package:chat_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/message_model.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  static ChatCubit get(context) => BlocProvider.of(context);

  TextEditingController messageController = TextEditingController();

  // Create a CollectionReference called users that references the firestore collection
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessageCollection);

  void sendMessage(String message) {
    messages.add({kMessage: message}).then((value) {
      messageController.clear();
      emit(ChatSendMessageSuccessState());
    }).catchError((error) {
      emit(ChatSendMessageErrorState(error.toString()));
    });
  }

  List<MessageModel> model = [];

  void getMessage() {
    emit(ChatGetMessageLoadingState());
    messages.get().then((value) {
      print(value.docs[1][kMessage]);
      for (int i = 0; i < value.docs.length; i++) {
        model.add(MessageModel.fromJson(value.docs[i]));
        print(model.length);
      }
      emit(ChatGetMessageSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ChatGetMessageErrorState(error.toString()));
    });
  }
}
