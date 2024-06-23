import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference patients =
      FirebaseFirestore.instance.collection('patients');

  Future<void> addPatient(String name, String email, String lat, String long) {
    return patients.add(
      {'name': name, 'email': email, 'latitude': lat, 'longitude': long},
    );
  }

  Stream<QuerySnapshot> getPatientsStream() {
    final patientsStream =
        patients.orderBy('name', descending: false).snapshots();
    return patientsStream;
  }

  Future<void> deletePatient(String docID) {
    return patients.doc(docID).delete();
  }
}
