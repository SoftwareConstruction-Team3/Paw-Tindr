// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:paw_tindr/views/login_view.dart';

Widget createLoginScreen() => const MaterialApp(
      home: LoginView(),
    );

void main() {
  group('Unit tests for widgets used in different views', () {
    testWidgets('check login view works properly', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(createLoginScreen());

      // Verify that our app begins at login screen
      expect(find.text('Login to your App'), findsOneWidget);
      expect(find.text('Register'), findsNothing);

      // Tap the email textfield and trigger a frame. Enter test email text
      var emailTextField = find.byType(TextField).at(0);
      await tester.tap(emailTextField);
      await tester.enterText(emailTextField, 'testuser@gmail.com');

      // Tap the password textfield and trigger a frame. Enter test email text
      var passwordTextField = find.byType(TextField).at(1);
      await tester.tap(passwordTextField);
      await tester.enterText(passwordTextField, '1234');

      expect(find.text('testuser@gmail.com'), findsOneWidget);
      expect(find.text('1234'), findsOneWidget);
    });
  });
}
