import 'package:dentist_app/pages/components.dart';
import 'package:flutter/material.dart';
import 'package:dentist_app/services/authentication.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthenticationService _authenticationService = AuthenticationService();

  void Register() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    final user = await _authenticationService.registerWithEmailAndPassword(
      emailController.text,
      passwordController.text,
      nameController.text,
    );

    print("User Regis : 😊🤣😊🤣🤣");
    print(user!.additionalUserInfo!.isNewUser);

    Navigator.pop(context);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color(0xff72c0fe),
      body: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 10,
              left: 50,
              right: 50,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 250,
                    child: Image.asset(
                      "assets/images/logo_gigi.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                      height: 2), // Memberikan jarak antara gambar dan teks
                  Container(
                    //color: Colors.black.withOpacity(0.5),
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      "REGISTER",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  AuthTextField(
                      controller: nameController,
                      labelText: "Name",
                      obscureText: false),
                  const SizedBox(height: 10), // Spacer
                  AuthTextField(
                      controller: emailController,
                      labelText: "Email",
                      obscureText: false),
                  const SizedBox(height: 10), // Spacer
                  AuthTextField(
                      controller: ageController,
                      labelText: "Age",
                      obscureText: false),
                  const SizedBox(height: 10), // Spacer
                  AuthTextField(
                      controller: addressController,
                      labelText: "Address",
                      obscureText: false),
                  const SizedBox(height: 10), // Spacer
                  AuthTextField(
                    controller: passwordController,
                    labelText: "Password",
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Aksi saat tombol di tekan
                          Register();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
