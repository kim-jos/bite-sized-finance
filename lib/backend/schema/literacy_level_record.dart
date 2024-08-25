import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LiteracyLevelRecord extends FirestoreRecord {
  LiteracyLevelRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "level" field.
  String? _level;
  String get level => _level ?? '';
  bool hasLevel() => _level != null;

  // "badge_image" field.
  String? _badgeImage;
  String get badgeImage => _badgeImage ?? '';
  bool hasBadgeImage() => _badgeImage != null;

  void _initializeFields() {
    _level = snapshotData['level'] as String?;
    _badgeImage = snapshotData['badge_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('literacy_level');

  static Stream<LiteracyLevelRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LiteracyLevelRecord.fromSnapshot(s));

  static Future<LiteracyLevelRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LiteracyLevelRecord.fromSnapshot(s));

  static LiteracyLevelRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LiteracyLevelRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LiteracyLevelRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LiteracyLevelRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LiteracyLevelRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LiteracyLevelRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLiteracyLevelRecordData({
  String? level,
  String? badgeImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'level': level,
      'badge_image': badgeImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class LiteracyLevelRecordDocumentEquality
    implements Equality<LiteracyLevelRecord> {
  const LiteracyLevelRecordDocumentEquality();

  @override
  bool equals(LiteracyLevelRecord? e1, LiteracyLevelRecord? e2) {
    return e1?.level == e2?.level && e1?.badgeImage == e2?.badgeImage;
  }

  @override
  int hash(LiteracyLevelRecord? e) =>
      const ListEquality().hash([e?.level, e?.badgeImage]);

  @override
  bool isValidKey(Object? o) => o is LiteracyLevelRecord;
}
