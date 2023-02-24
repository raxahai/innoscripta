import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innoscripta/firebase_options.dart';
import 'package:innoscripta/injection_container.dart' as di;
import 'package:innoscripta/screens/sign_up/presentation/screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // injecting dependencies
  await di.init();

  // initializing firebase SDK
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus();
      },
      child: GetMaterialApp(
        title: 'Innoscripta',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Casper',
        ),
        home: SignupScreen(),
      ),
    );
  }
}
