import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  ChatCubit get(context) => BlocProvider.of(context);

  FirebaseFirestore firestore = FirebaseFirestore.instance;
}
