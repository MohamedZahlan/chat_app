import 'package:chat_app/cubits/login_cubit/register_states.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/constants.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  String? email;
  String? password;
  bool isPassword = true;

  // This method used to change password state
  void changePasswordMode() {
    isPassword = !isPassword;
    emit(RegisterChangePasswordModeState());
  }

  // this method used to create an account
  void userCreateAccount(context) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      showSnackBar(context,
          text: "Register Success, login now to start chatting.");
      navigateToFinish(context, LoginView());
      emit(RegisterCreateUserSuccessState());
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

      emit(RegisterCreateUserErrorState(error.toString()));
    });
  }
}
