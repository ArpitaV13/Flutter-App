import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_app/screens/signIn.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {


  const HomeScreen({Key? key}) : super(key: key);
  

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   User? user;

  @override
  
   void initState() {
    super.initState();
    // Retrieve the current user when the widget initializes
    user = FirebaseAuth.instance.currentUser;

    // Listen for changes in the authentication state
    FirebaseAuth.instance.authStateChanges().listen((User? newUser) {
      setState(() {
        user = newUser;
      });
    });
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome,",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              user != null ? user!.email ?? '' : 'User email not found',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Logout"),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("Signed Out");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                });
              },
            ),
          ], // Close the children list
        ), // Close the Column widget
      ), // Close the Center widget
    ); // Close the Scaffold widget
  }
}
