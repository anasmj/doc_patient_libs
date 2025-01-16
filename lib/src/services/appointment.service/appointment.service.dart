import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:flutter/foundation.dart';

///use these keywords to work with collections

class AppointmentService {
  // Firestore instance (can be shared across static methods)
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const reqeusted = 'requested_appointments';
  static const approved = 'approved_appointments';
  static const past = 'past_appointments';
  // Create a new appointment
  static Future<void> create(Appointment appointment) async {
    try {
      await _firestore
          .collection(appointment.serial != null ? approved : reqeusted)
          .doc(appointment.id)
          .set(appointment.toMap());
      debugPrint('Appointment created successfully.');
    } catch (e) {
      debugPrint('Error creating appointment: $e');
    }
  }

  // Get all appointments in a specific collection
  static Future<List<Map<String, dynamic>>> get(String collectionName) async {
    try {
      final snapshot = await _firestore.collection(collectionName).get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      debugPrint('Error fetching appointments: $e');
      return [];
    }
  }

  // Get all appointments in a specific collection
  static Future<List<Map<String, dynamic>>> getAll(
      String collectionName) async {
    try {
      final snapshot = await _firestore.collection(collectionName).get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      debugPrint('Error fetching appointments: $e');
      return [];
    }
  }

  // Update an existing appointment
  static Future<void> update(String collectionName, String appointmentId,
      Map<String, dynamic> updatedData) async {
    try {
      await _firestore
          .collection(collectionName)
          .doc(appointmentId)
          .update(updatedData);
      debugPrint(
          'Appointment updated successfully in $collectionName collection.');
    } catch (e) {
      debugPrint('Error updating appointment: $e');
    }
  }

  // Delete an appointment
  static Future<void> delete(
      String collectionName, String appointmentId) async {
    try {
      await _firestore.collection(collectionName).doc(appointmentId).delete();
      debugPrint(
          'Appointment deleted successfully from $collectionName collection.');
    } catch (e) {
      debugPrint('Error deleting appointment: $e');
    }
  }

  // Move appointment to another collection
  static Future<void> moveAppointment(
      String fromCollection, String toCollection, String appointmentId) async {
    try {
      // Get the current appointment data
      final docRef = _firestore.collection(fromCollection).doc(appointmentId);
      final snapshot = await docRef.get();

      if (snapshot.exists) {
        final data = snapshot.data();

        // Add the appointment to the target collection
        await _firestore.collection(toCollection).doc(appointmentId).set(data!);

        // Remove the appointment from the original collection
        await docRef.delete();

        debugPrint('Appointment moved from $fromCollection to $toCollection.');
      } else {
        debugPrint('Appointment not found in $fromCollection collection.');
      }
    } catch (e) {
      debugPrint('Error moving appointment: $e');
    }
  }

  ///Takes appointment object and moves it to [approved] collection and  deletes from [reqeusted].
  static Future<void> approve(Appointment appt) async {
    try {
      final docRef = _firestore.collection(reqeusted).doc(appt.id);
      final snapshot = await docRef.get();
      if (!snapshot.exists) return;
      await _firestore.collection(approved).doc(appt.id).set(appt.toMap());
      await docRef.delete();
    } catch (e) {
      rethrow;
    }
  }

  ///Takes appointment ID and moves it to [past] collection
  static Future<void> done(String id) async {
    try {
      final docRef = _firestore.collection(approved).doc(id);
      final snapshot = await docRef.get();

      if (!snapshot.exists) return;
      final data = snapshot.data();
      if (data == null) return;
      await _firestore.collection(past).doc(id).set(data);
      await docRef.delete();
    } catch (e) {
      rethrow;
    }
  }
}
