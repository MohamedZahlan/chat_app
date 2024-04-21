import 'package:chat_app/views/chat_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/constants.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  String? email;
  String? password;
  bool isPassword = true;

  // This method used to change password state
  void changePasswordMode() {
    isPassword = !isPassword;
    emit(LoginChangePasswordModeState());
  }

  // this method used to create an account
  void userSignIn(context) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      showSnackBar(context, text: "Login Success, start chatting now.");
      navigateToFinish(context, const ChatView());
      emit(LoginSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }

      switch (error.code) {
        case "invalid-custom-token":
          showSnackBar(context,
              text: "The supplied token is not a Firebase custom auth token.");
          break;
        case "custom-token-mismatch":
          showSnackBar(
            context,
            text: "The supplied token is for a different Firebase project.",
          );
        case "invalid-credential":
          showSnackBar(
            context,
            text: "The E-mail or Password is false.",
          );
          break;
        case "network-request-failed":
          showSnackBar(
            context,
            text: "Please check your network connection. ",
          );
          break;
        case "weak-password":
          showSnackBar(context,
              text: "Password should be at least 6 characters.");
          break;
        case "email-already-in-use":
          showSnackBar(context,
              text: "The email address is already in use by another account.");
          break;
        default:
          showSnackBar(context, text: "There was an error, please try again");
      }

      emit(LoginErrorState(error.toString()));
    });
  }
}
