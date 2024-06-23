import 'dart:io';
import 'package:dentist_app/pages/components.dart';
import 'package:dentist_app/pages/patients.dart';
import 'package:dentist_app/services/firestore.dart';
import 'package:dentist_app/widgets/camera_page.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class RegisPatientForm extends StatefulWidget {
  const RegisPatientForm({super.key});

  @override
  State<RegisPatientForm> createState() => _RegisPatientFormState();
}

class _RegisPatientFormState extends State<RegisPatientForm> {
  late String lat = "";
  late String long = "";

  final FirestoreService firestoreService = FirestoreService();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  File? imageFile;

  Future<Position> _getCurrentLocation() async {
    bool servicesEnabled = await Geolocator.isLocationServiceEnabled();
    if (!servicesEnabled) {
      return Future.error("Location service are disabled");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Permission Denied");
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  void getLocation() {
    _getCurrentLocation().then((value) {
      lat = "${value.latitude}";
      long = "${value.longitude}";
      setState(() {
        print("🤣$lat");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 400,
            child: Column(
              children: [
                const Text(
                  "Patient Registration Form",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                AuthTextField(
                    controller: nameController,
                    labelText: "Name",
                    obscureText: false),
                const SizedBox(height: 20),
                AuthTextField(
                    controller: emailController,
                    labelText: "Email",
                    obscureText: false),
                const SizedBox(height: 20),
                Text("Your BPJS or any Healthy Card Picture",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700)),
                SizedBox(
                  width: 350,
                  height: 200,
                  child: (imageFile != null)
                      ? (Image.file(imageFile!))
                      : Container(
                          decoration: BoxDecoration(border: Border.all())),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text("Take Picture"),
                  onPressed: () async {
                    final result = await Navigator.push<File>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CameraPage(),
                      ),
                    );
                    if (result != null) {
                      setState(
                        () {
                          imageFile = result;
                        },
                      );
                    }
                  },
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: TextEditingController(text: lat),
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Your Latitude",
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: TextEditingController(text: long),
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Your Longitude",
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    getLocation();
                  },
                  child: const Text("Get Location"),
                ),
                SizedBox(
                  width: 350,
                  child: Expanded(
                    child: GestureDetector(
                      onTap: () {
                        firestoreService.addPatient(nameController.text,
                            emailController.text, lat, long);
                        lat = "";
                        long = "";
                        nameController.clear();
                        emailController.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Patient Added Successfully')),
                        );
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        margin: const EdgeInsets.symmetric(vertical: 25),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
