import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_patient_libs/src/models/models.dart';
import 'package:doc_patient_libs/src/services/base.service.dart';
import 'package:doc_patient_libs/src/services/collections.dart';

class ChemberService extends BaseService<Chember> {
  ChemberService._();

  static final ChemberService instance = ChemberService._();

  final CollectionReference _chemberCollection =
      FirebaseFirestore.instance.collection(Collection.chember);

  @override
  Future<String?> create(Chember data) async {
    try {
      DocumentReference docRef = await _chemberCollection.add(data);
      return docRef.id;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Chember?> read(String id) async {
    try {
      DocumentSnapshot doc = await _chemberCollection.doc(id).get();
      final data = doc.exists ? doc.data() as RawData : null;
      if (data == null) return null;
      return Chember.fromMap(data);
    } catch (e) {
      // print("Error reading document: $e");
      return null;
    }
  }

  @override
  Future<List<Chember>> readAll() async {
    try {
      QuerySnapshot querySnapshot = await _chemberCollection.get();
      final datas =
          querySnapshot.docs.map((doc) => doc.data() as RawData).toList();
      return datas.map((data) => Chember.fromMap(data)).toList();
    } catch (e) {
      // print("Error reading all documents: $e");
      return [];
    }
  }
  // Future<List<RawData>> readAll() async {
  //   try {
  //     QuerySnapshot querySnapshot = await _chemberCollection.get();
  //     return querySnapshot.docs.map((doc) => doc.data() as RawData).toList();
  //   } catch (e) {
  //     // print("Error reading all documents: $e");
  //     return [];
  //   }
  // }

  @override
  Future<bool> update(String id, Chember data) async {
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
// class ChemberService {
//   ChemberService._();

//   static final ChemberService instance = ChemberService._();

//   final CollectionReference _chemberCollection =
//       FirebaseFirestore.instance.collection('chember');

//   Future<void> createChember(Map<String, dynamic> data) async {
//     try {
//       await _chemberCollection.add(data);
//     } catch (e) {
//       //
//     }
//   }

//   Future<List<Map<String, dynamic>>> readChember() async {
//     try {
//       QuerySnapshot querySnapshot = await _chemberCollection.get();
//       return querySnapshot.docs
//           .map((doc) => {
//                 ...doc.data() as Map<String, dynamic>,
//                 'id': doc.id,
//               })
//           .toList();
//     } catch (e) {
//       return [];
//     }
//   }

//   Future<void> updateChember(String id, Map<String, dynamic> data) async {
//     try {
//       await _chemberCollection.doc(id).update(data);
//     } catch (e) {
//       //
//     }
//   }

//   Future<void> deleteChember(String id) async {
//     try {
//       await _chemberCollection.doc(id).delete();
//     } catch (e) {
//       //
//     }
//   }
// }
