import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_app/screens/signUp.dart';
import 'package:flutter_login_app/screens/signIn.dart';
import 'package:flutter_login_app/screens/home.dart';

void main() {
  group('SignUpScreen widget test', () {
    testWidgets('UI elements are rendered', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SignUpScreen()));

      expect(find.byType(TextField), findsNWidgets(3));

      expect(find.text('Sign Up'), findsOneWidget);
    });

    testWidgets('Successful sign-up navigates to home screen', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SignUpScreen()));

 
      await tester.enterText(find.byKey(Key('usernameTextField')), 'testuser');
      await tester.enterText(find.byKey(Key('emailTextField')), 'test@example.com');
      await tester.enterText(find.byKey(Key('passwordTextField')), 'password');


      await tester.tap(find.text('Sign Up'));
      await tester.pumpAndSettle();

 
      expect(find.byType(HomeScreen), findsOneWidget);
    });
  });
}
