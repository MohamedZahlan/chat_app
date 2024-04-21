import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/cubits/login_cubit/login_cubit.dart';
import 'package:chat_app/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../themes/colors.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/custom_text_field_widget.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return SafeArea(
            child: ModalProgressHUD(
              color: kPrimaryColor,
              blur: 8.0,
              inAsyncCall: state is LoginLoadingState ? true : false,
              child: Scaffold(
                body: Center(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width(context) / 30),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
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
                              height: height(context) / 10,
                            ),
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Text(
                                "Sign In",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                            SizedBox(
                              height: height(context) / 20,
                            ),
                            CustomTextField(
                              const Icon(Icons.person),
                              onChanged: (value) {
                                cubit.email = value;
                              },
                              hintText: "Enter your E-mail",
                              textInputAction: TextInputAction.next,
                            ),
                            SizedBox(
                              height: height(context) / 30,
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
                            // Login Button
                            CustomButton(
                              text: "Sign In",
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.userSignIn(context);
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
                                const Text("Don't have an account? "),
                                GestureDetector(
                                  onTap: () {
                                    navigateToFinish(context, RegisterView());
                                  },
                                  child: Text(
                                    "Register",
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
