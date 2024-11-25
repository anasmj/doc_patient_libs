import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:doc_patient_libs/src/services/frebase.crud.dart';

class TeamService extends FirebaseCRUD {
  TeamService() : super(collection: 'team');
  static final TeamService instance = TeamService();

  Future<String?> addTeamMember(Admin admin) async {
    try {
      return await create(admin.toMap());
    } catch (e) {
      rethrow;
    }
  }

  Future<Admin?> getTeamMember(String id) async {
    try {
      final adminData = await getSingle(id);
      if (adminData == null) return null;
      return Admin.fromMap(adminData);
    } catch (e) {
      rethrow;
    }
  }

   Future<List<Admin>> getTeamMembers() async {
    try {
      final membersData = await getAll();
      return membersData.map((data) => Admin.fromMap(data)).toList();
    } catch (e) {
      // print("Error reading all documents: $e");
      rethrow;
    }
  }

  Future<bool> updateTeamMember(String id, Admin data) async {
    try {
      return await update(id, data.toMap());
    } catch (e) {
      rethrow;
    }
  }

   
  Future<bool> deleteTeamMember(String id) async {
    try {
      return await delete(id);
    } catch (e) {
      rethrow;
    }
  }
}
