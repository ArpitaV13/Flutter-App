import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_login_app/screens/home.dart';
import 'package:flutter_login_app/screens/signIn.dart';
import 'package:flutter/material.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBoiB036cz3QUAEmb_deMfV1KOzz_NyBZ4", 
      appId: "1:607297522592:web:e081d4117c615000ce32c5", 
      messagingSenderId: "607297522592",
       projectId: "flutter-login-app-ffe50")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: (FirebaseAuth.instance.currentUser == null)
          ? SignInScreen()
          : HomeScreen(),
    );
  }
}
