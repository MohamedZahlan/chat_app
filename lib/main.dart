import 'package:bloc/bloc.dart';
import 'package:chat_app/themes/light_theme.dart';
import 'package:chat_app/views/register_view.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'cubits/bloc_observer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "RegisterView": (context) => RegisterView(),
        "LoginView": (context) => LoginView(),
      },
      theme: lightTheme,
      home: LoginView(),
    );
  }
}
