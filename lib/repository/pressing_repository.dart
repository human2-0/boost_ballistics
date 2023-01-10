import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:boost_ballistics/models/pressing_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PressingRepository {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<String> addStackPressing(Pressing pressing) async {
    DocumentReference docRef =
    await db.collection("stacksheets").add(pressing.toJson());
    return docRef.id;
  }
}

final pressingRepositoryProvider = Provider((ref) => PressingRepository());
