import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_patient_libs/src/models/models.dart';
import 'package:doc_patient_libs/src/services/base.service.dart';
import 'package:doc_patient_libs/src/services/collections.dart';

class AppointmentService extends BaseService<Appointment> {
  AppointmentService._();

  static final AppointmentService instance = AppointmentService._();

  final CollectionReference _chemberCollection =
      FirebaseFirestore.instance.collection(Collection.appointments);

  @override
  Future<String?> create(Appointment data) async {
    try {
      DocumentReference docRef = await _chemberCollection.add(data.toMap());
      return docRef.id;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Appointment?> getSingle(String id) async {
    try {
      DocumentSnapshot doc = await _chemberCollection.doc(id).get();
      final data = doc.exists ? doc.data() as RawData : null;
      if (data == null) return null;
      return Appointment.fromMap(data);
    } catch (e) {
      // print("Error reading document: $e");
      return null;
    }
  }

  @override
  Future<List<Appointment>> getAll() async {
    try {
      QuerySnapshot querySnapshot = await _chemberCollection.get();
      final datas =
          querySnapshot.docs.map((doc) => doc.data() as RawData).toList();
      return datas.map((data) => Appointment.fromMap(data)).toList();
    } catch (e) {
      // print("Error reading all documents: $e");
      return [];
    }
  }

  @override
  Future<bool> update(String id, Appointment data) async {
    try {
      await _chemberCollection.doc(id).update(data.toMap());
      return true;
    } catch (e) {
      // print("Error updating document: $e");
      return false;
    }
  }

  @override
  Future<bool> delete(String id) async {
    try {
      await _chemberCollection.doc(id).delete();
      return true;
    } catch (e) {
      // print("Error deleting document: $e");
      return false;
    }
  }
}
