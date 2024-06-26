import 'package:dentist_app/pages/bottom_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dentist_app/pages/welcome.dart';
import 'package:dentist_app/services/authentication.dart';

class AuthenticationGate extends StatelessWidget {
  final AuthenticationService _authenticationService = AuthenticationService();

  AuthenticationGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: _authenticationService.userStream,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            print("🤣🤣🤣");
            print(snapshot);
            return BottomNavbar(userUid: snapshot.data!.uid);
          } else {
            return const Welcome();
          }
        }),
      ),
    );
  }
}
