import 'package:dentist_app/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:dentist_app/pages/login.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFF72C0FE), // Menggunakan warna putih sebagai latar belakang
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10.0), // Menggunakan padding secara langsung
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "WELCOME",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            Image.asset(
              'assets/images/logo-images.png',
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(
                height: 30), // Menggunakan const untuk widget yang tetap
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Tambahkan aksi untuk tombol Sign In
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors
                    .blue, // Menggunakan warna biru sebagai latar belakang tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: const Size(double.infinity, 60), // Mengatur lebar tombol
              ),
              child: const Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {
                // Tambahkan aksi untuk tombol Login
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Register()),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: const Color(
                    0xFFB4D4F1), // Menggunakan latar belakang putih untuk tombol teks
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: const Size(double.infinity, 60), // Mengatur lebar tombol
              ),
              child: const Text(
                'REGISTER',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
