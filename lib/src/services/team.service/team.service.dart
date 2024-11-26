import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:doc_patient_libs/src/services/collections.dart';
import 'package:doc_patient_libs/src/services/frebase.crud.dart';

class TeamService extends FirebaseCRUD {
  TeamService() : super(collection: Collection.adminTeamMembers);
  static final TeamService instance = TeamService();

  Future<String?> addTeamMember(TeamMember member) async {
    try {
      return await create(member.toMap());
    } catch (e) {
      rethrow;
    }
  }

  Future<TeamMember?> getTeamMember(String id) async {
    try {
      final adminData = await getSingle(id);
      if (adminData == null) return null;
      return TeamMember.fromMap(adminData);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TeamMember>> getTeamMembers() async {
    try {
      final membersData = await getAll();
      return membersData.map((data) => TeamMember.fromMap(data)).toList();
    } catch (e) {
      // print("Error reading all documents: $e");
      rethrow;
    }
  }

  Future<bool> updateTeamMember(String id, TeamMember data) async {
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
