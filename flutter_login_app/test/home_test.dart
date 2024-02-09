import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_app/screens/home.dart';
import 'package:flutter_login_app/screens/signIn.dart';

class MockUser extends Fake implements User {
  @override
  String get uid => 'mockUid';

  @override
  String? get email => 'test@example.com';
}

void main() {
  group('HomeScreen widget test', () {
    testWidgets('User email is displayed correctly', (WidgetTester tester) async {
      final mockUser = MockUser();


      final mockFirebaseAuth = MockFirebaseAuth(mockUser);
      await tester.pumpWidget(MaterialApp(home: HomeScreen()));


      expect(find.text('test@example.com'), findsOneWidget);
    });

    testWidgets('Logout button works correctly', (WidgetTester tester) async {

      final mockUser = MockUser();


      final mockFirebaseAuth = MockFirebaseAuth(mockUser);
      await tester.pumpWidget(MaterialApp(home: HomeScreen()));

      await tester.tap(find.text('Logout'));
      await tester.pumpAndSettle();


      expect(find.byType(SignInScreen), findsOneWidget);
    });
  });
}

class MockFirebaseAuth extends Fake implements FirebaseAuth {
  final User? user;

  MockFirebaseAuth(this.user);

  @override
  Stream<User?> authStateChanges() {
    return Stream.value(user);
  }
}
