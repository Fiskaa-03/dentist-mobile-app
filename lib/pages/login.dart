import 'package:dentist_app/pages/components.dart';
import 'package:flutter/material.dart';
import 'package:dentist_app/services/authentication.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthenticationService _authenticationService = AuthenticationService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    final user = await _authenticationService.signInWithEmailAndPassword(
      emailController.text,
      passwordController.text,
    );

    print("User Login :😊🤣😊🤣🤣");
    print(user);

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed')),
      );
    }

    Navigator.pop(context);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              SizedBox(
                width: 350,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          color: Color(0xFF72C0FE),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Image.asset(
                          "assets/icons/arrow-left.png",
                          width: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo_gigi.png"),
                ],
              ),
              const Text(
                "Login To Your Account",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    child: Expanded(
                      child: Column(
                        children: [
                          AuthTextField(
                            controller: emailController,
                            labelText: "Email",
                            obscureText: false,
                          ),
                          const SizedBox(height: 20),
                          AuthTextField(
                            controller: passwordController,
                            labelText: "Password",
                            obscureText: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 350,
                child: Expanded(
                  child: GestureDetector(
                    onTap: signUserIn,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      margin: const EdgeInsets.symmetric(vertical: 25),
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Center(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                      color: Color(0xFFE9E9E9),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Image.asset(
                      "assets/icons/google.png",
                      width: 50,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                      color: Color(0xFFE9E9E9),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Image.asset("assets/icons/apple.png", width: 50),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                      color: Color(0xFFE9E9E9),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Image.asset("assets/icons/facebook.png", width: 50),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
