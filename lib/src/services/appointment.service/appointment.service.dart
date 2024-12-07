import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:doc_patient_libs/src/services/base.service.dart';

class AppointmentService extends BaseService<Appointment> {
  AppointmentService._();

  static final AppointmentService instance = AppointmentService._();

  final CollectionReference _collection =
      FirebaseFirestore.instance.collection(ServiceCollection.appointments);

  @override
  Future<String?> create(Appointment data) async {
    try {
      DocumentReference docRef = await _collection.add(data.toMap());
      return docRef.id;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Appointment?> getSingle(String id) async {
    try {
      DocumentSnapshot doc = await _collection.doc(id).get();
      final data = doc.exists ? doc.data() as RawData : null;
      if (data == null) return null;
      return Appointment.fromMap(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Appointment>> getAll() async {
    try {
      QuerySnapshot querySnapshot = await _collection.get();
      final datas =
          querySnapshot.docs.map((doc) => doc.data() as RawData).toList();
      return datas.map((data) => Appointment.fromMap(data)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> update(String id, Appointment data) async {
    try {
      await _collection.doc(id).update(data.toMap());
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> delete(String id) async {
    try {
      await _collection.doc(id).delete();
      return true;
    } catch (e) {
      // print("Error deleting document: $e");
      rethrow;
    }
  }
}
