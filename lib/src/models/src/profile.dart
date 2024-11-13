part of '../models.dart';

class Profile {
  final String name;
  final String email;
  final String photoUrl;
  final ProfileType type;
  final String? uid;
  Profile({
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.type,
    this.uid,
  });
}
