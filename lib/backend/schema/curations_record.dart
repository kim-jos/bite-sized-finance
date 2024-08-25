import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CurationsRecord extends FirestoreRecord {
  CurationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "image_thumbnail" field.
  String? _imageThumbnail;
  String get imageThumbnail => _imageThumbnail ?? '';
  bool hasImageThumbnail() => _imageThumbnail != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "FK_literacy_level" field.
  DocumentReference? _fKLiteracyLevel;
  DocumentReference? get fKLiteracyLevel => _fKLiteracyLevel;
  bool hasFKLiteracyLevel() => _fKLiteracyLevel != null;

  void _initializeFields() {
    _imageThumbnail = snapshotData['image_thumbnail'] as String?;
    _video = snapshotData['video'] as String?;
    _fKLiteracyLevel = snapshotData['FK_literacy_level'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('curations');

  static Stream<CurationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CurationsRecord.fromSnapshot(s));

  static Future<CurationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CurationsRecord.fromSnapshot(s));

  static CurationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CurationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CurationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CurationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CurationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CurationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCurationsRecordData({
  String? imageThumbnail,
  String? video,
  DocumentReference? fKLiteracyLevel,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image_thumbnail': imageThumbnail,
      'video': video,
      'FK_literacy_level': fKLiteracyLevel,
    }.withoutNulls,
  );

  return firestoreData;
}

class CurationsRecordDocumentEquality implements Equality<CurationsRecord> {
  const CurationsRecordDocumentEquality();

  @override
  bool equals(CurationsRecord? e1, CurationsRecord? e2) {
    return e1?.imageThumbnail == e2?.imageThumbnail &&
        e1?.video == e2?.video &&
        e1?.fKLiteracyLevel == e2?.fKLiteracyLevel;
  }

  @override
  int hash(CurationsRecord? e) => const ListEquality()
      .hash([e?.imageThumbnail, e?.video, e?.fKLiteracyLevel]);

  @override
  bool isValidKey(Object? o) => o is CurationsRecord;
}
