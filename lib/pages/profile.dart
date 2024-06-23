import 'package:flutter/material.dart';
import 'package:dentist_app/services/authentication.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthenticationService authenticationService =
        AuthenticationService();

    return Center(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(2.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: IconButton(
                  onPressed: () {
                    authenticationService.signOut();
                  },
                  icon: Image.asset(
                    "assets/icons/logout.png",
                    width: 50,
                  ),
                ),
              ),
              const Text("Logout"),
            ],
          ),
        ),
      ]),
    );
  }
}
