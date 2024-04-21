abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterChangePasswordModeState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterCreateUserSuccessState extends RegisterStates {}

class RegisterCreateUserErrorState extends RegisterStates {
  final error;

  RegisterCreateUserErrorState(this.error);
}
