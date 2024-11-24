import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:doc_patient_libs/src/services/base.service.dart';
import 'package:doc_patient_libs/src/services/collections.dart';

class TeamService extends BaseService<Admin> {
  TeamService._();

  static final TeamService instance = TeamService._();

  final CollectionReference _collection =
      FirebaseFirestore.instance.collection(Collection.adminTeam);

  @override
  Future<String?> create(Admin data) async {
    try {
      DocumentReference docRef = await _collection.add(data);
      return docRef.id;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Admin?> getSingle(String id) async {
    try {
      DocumentSnapshot doc = await _collection.doc(id).get();
      final data = doc.exists ? doc.data() as RawData : null;
      if (data == null) return null;
      return Admin.fromMap(data);
    } catch (e) {
      // print("Error reading document: $e");
      return null;
    }
  }

  @override
  Future<List<Admin>> getAll() async {
    try {
      QuerySnapshot querySnapshot = await _collection.get();
      final datas =
          querySnapshot.docs.map((doc) => doc.data() as RawData).toList();
      return datas.map((data) => Admin.fromMap(data)).toList();
    } catch (e) {
      // print("Error reading all documents: $e");
      return [];
    }
  }

  @override
  Future<bool> update(String id, Admin data) async {
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
