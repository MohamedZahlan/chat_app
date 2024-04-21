import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/cubits/login_cubit/register_cubit.dart';
import 'package:chat_app/themes/colors.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../cubits/login_cubit/register_states.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/custom_text_field_widget.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          RegisterCubit cubit = RegisterCubit.get(context);

          return SafeArea(
            child: ModalProgressHUD(
              color: kPrimaryColor,
              blur: 8.0,
              inAsyncCall: state is RegisterLoadingState ? true : false,
              child: Scaffold(
                body: Center(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width(context) / 30),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/scholar.png"),
                            Text(
                              "Scholar Chat",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontFamily: "Pacifico",
                                  ),
                            ),
                            SizedBox(
                              height: height(context) / 20,
                            ),
                            Text(
                              "Sign Up",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            SizedBox(
                              height: height(context) / 20,
                            ),
                            CustomTextField(
                              const Icon(Icons.email_outlined),
                              onChanged: (value) {
                                cubit.email = value;
                              },
                              hintText: "Enter your E-mail",
                              textInputAction: TextInputAction.next,
                            ),
                            SizedBox(
                              height: height(context) / 20,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                hintText: "Enter your Password",
                                hintStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                                prefixIcon: const Icon(Icons.lock_outline),
                                prefixIconColor: Colors.white,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    cubit.changePasswordMode();
                                  },
                                  icon: cubit.isPassword
                                      ? const Icon(
                                          Icons.remove_red_eye_outlined,
                                        )
                                      : const Icon(
                                          Icons.visibility_off,
                                        ),
                                ),
                                suffixIconColor: Colors.white,
                              ),
                              onChanged: (value) {
                                cubit.password = value;
                              },
                              textInputAction: TextInputAction.done,
                              obscureText: cubit.isPassword,
                              cursorColor: Colors.white,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Make sure you're write everything right";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: height(context) / 20,
                            ),
                            // state is RegisterLoadingState
                            //     ? const CircularProgressIndicator(
                            //         color: Colors.white,
                            //       )
                            //     :
                            // Login Button
                            CustomButton(
                              text: "Sign Up",
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.userCreateAccount(context);
                                } else {
                                  showSnackBar(context,
                                      text:
                                          "There was an error, please try again");
                                }
                              },
                            ),
                            SizedBox(
                              height: height(context) / 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already have an account? "),
                                GestureDetector(
                                  onTap: () {
                                    navigateToFinish(context, LoginView());
                                  },
                                  child: Text(
                                    "Sign In",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: const Color(0xffC7EDE6),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
