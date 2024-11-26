import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_patient_libs/src/models/models.dart';
import 'package:doc_patient_libs/src/services/base.service.dart';
import 'package:doc_patient_libs/src/services/service.collections.dart';

class ChemberService extends BaseService<Chember> {
  ChemberService._();

  static final ChemberService instance = ChemberService._();

  final CollectionReference _collection =
      FirebaseFirestore.instance.collection(ServiceCollection.chember);

  @override
  Future<String?> create(Chember data) async {
    try {
      DocumentReference docRef = await _collection.add(data);
      return docRef.id;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Chember?> getSingle(String id) async {
    try {
      DocumentSnapshot doc = await _collection.doc(id).get();
      final data = doc.exists ? doc.data() as RawData : null;
      if (data == null) return null;
      return Chember.fromMap(data);
    } catch (e) {
      // print("Error reading document: $e");
      return null;
    }
  }

  @override
  Future<List<Chember>> getAll() async {
    try {
      QuerySnapshot querySnapshot = await _collection.get();
      final datas =
          querySnapshot.docs.map((doc) => doc.data() as RawData).toList();
      return datas.map((data) => Chember.fromMap(data)).toList();
    } catch (e) {
      // print("Error reading all documents: $e");
      return [];
    }
  }

  @override
  Future<bool> update(String id, Chember data) async {
    try {
      await _collection.doc(id).update(data.toMap());
      return true;
    } catch (e) {
      // print("Error updating document: $e");
      return false;
    }
  }

  @override
  Future<bool> delete(String id) async {
    try {
      await _collection.doc(id).delete();
      return true;
    } catch (e) {
      // print("Error deleting document: $e");
      return false;
    }
  }
}
