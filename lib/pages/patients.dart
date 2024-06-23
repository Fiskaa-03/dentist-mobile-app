import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dentist_app/services/firestore.dart';
import 'package:dentist_app/widgets/regis_patient_form.dart';
import 'package:flutter/material.dart';

class Patients extends StatelessWidget {
  const Patients({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white.withOpacity(0),
          toolbarHeight: 220,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Patient List",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 360,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisPatientForm(),
                      ),
                    );
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
                        "Patient Registration",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: const PatientList(),
        ),
      ],
    );
  }
}

class PatientList extends StatefulWidget {
  const PatientList({super.key});

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getPatientsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No Patients"));
          }

          List<DocumentSnapshot> patientsList = snapshot.data!.docs;

          return ListView.builder(
            shrinkWrap: true,
            itemCount: patientsList.length,
            itemBuilder: (context, index) {
              if (index >= patientsList.length) {
                return Container(); // Prevents index out of range error
              }

              DocumentSnapshot document = patientsList[index];
              String docID = document.id;

              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              String patientName = data['name'] ?? 'No Name';
              String patientEmail = data['email'] ?? 'No Name';

              return ListTile(
                title: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Patient Name : ${patientName}"),
                        Text("Patient Email : ${patientEmail}"),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            ElevatedButton(
                                child: const Text("Delete"),
                                onPressed: () {
                                  firestoreService.deletePatient(docID);
                                })
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
