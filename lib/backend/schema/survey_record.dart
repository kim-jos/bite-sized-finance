import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SurveyRecord extends FirestoreRecord {
  SurveyRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
    _order = castToType<int>(snapshotData['order']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('survey');

  static Stream<SurveyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SurveyRecord.fromSnapshot(s));

  static Future<SurveyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SurveyRecord.fromSnapshot(s));

  static SurveyRecord fromSnapshot(DocumentSnapshot snapshot) => SurveyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SurveyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SurveyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SurveyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SurveyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSurveyRecordData({
  String? question,
  int? order,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
      'order': order,
    }.withoutNulls,
  );

  return firestoreData;
}

class SurveyRecordDocumentEquality implements Equality<SurveyRecord> {
  const SurveyRecordDocumentEquality();

  @override
  bool equals(SurveyRecord? e1, SurveyRecord? e2) {
    return e1?.question == e2?.question && e1?.order == e2?.order;
  }

  @override
  int hash(SurveyRecord? e) =>
      const ListEquality().hash([e?.question, e?.order]);

  @override
  bool isValidKey(Object? o) => o is SurveyRecord;
}
