// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_login_app/main.dart';
// import 'package:flutter_login_app/screens/signIn.dart';
// import 'package:flutter_login_app/screens/signUp.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:mockito/mockito.dart';

// void main() {
//   // Define a mock FirebaseAuth instance
//   late MockFirebaseAuth mockFirebaseAuth;

//   setUp(() {
//     // Initialize the mockFirebaseAuth instance before each test
//     mockFirebaseAuth = MockFirebaseAuth();
//     // Mock the behavior of signInWithEmailAndPassword method
//     when(mockFirebaseAuth.signInWithEmailAndPassword(
//       email: anyNamed('email'),
//       password: anyNamed('password'),
//     )).thenAnswer((_) => Future.value(UserCredential(user: MockUser())));
//   });

//   testWidgets('Test Sign In Screen', (WidgetTester tester) async {
//     // Build SignInScreen widget
//     await tester.pumpWidget(
//       MaterialApp(
//         home: SignInScreen(firebaseAuth: mockFirebaseAuth), // Inject mockFirebaseAuth
//       ),
//     );

//     // Verify that the 'Enter UserName' and 'Enter Password' texts are found
//     expect(find.text('Enter UserName'), findsOneWidget);
//     expect(find.text('Enter Password'), findsOneWidget);

//     // Simulate tapping the 'Sign In' button
//     await tester.tap(find.text('Sign In'));
//     await tester.pump();

//     // Verify that the "Don't have an account?" text is found
//     expect(find.text("Don't have an account?"), findsOneWidget);

//     // Simulate tapping the 'Sign Up' button
//     await tester.tap(find.text('Sign Up'));
//     await tester.pump();

//     // Verify that the SignUpScreen widget is found
//     expect(find.byType(SignUpScreen), findsOneWidget);
//   });
// }

// // Define a mock class that extends FirebaseAuth
// class MockFirebaseAuth extends Mock implements FirebaseAuth {}

// // Define a mock class that extends User
// class MockUser extends Mock implements User {}
