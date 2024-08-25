import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SurveyTransactionsRecord extends FirestoreRecord {
  SurveyTransactionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "FK_survey" field.
  DocumentReference? _fKSurvey;
  DocumentReference? get fKSurvey => _fKSurvey;
  bool hasFKSurvey() => _fKSurvey != null;

  // "FK_user" field.
  DocumentReference? _fKUser;
  DocumentReference? get fKUser => _fKUser;
  bool hasFKUser() => _fKUser != null;

  // "user_response" field.
  int? _userResponse;
  int get userResponse => _userResponse ?? 0;
  bool hasUserResponse() => _userResponse != null;

  void _initializeFields() {
    _fKSurvey = snapshotData['FK_survey'] as DocumentReference?;
    _fKUser = snapshotData['FK_user'] as DocumentReference?;
    _userResponse = castToType<int>(snapshotData['user_response']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('survey_transactions');

  static Stream<SurveyTransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SurveyTransactionsRecord.fromSnapshot(s));

  static Future<SurveyTransactionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SurveyTransactionsRecord.fromSnapshot(s));

  static SurveyTransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SurveyTransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SurveyTransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SurveyTransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SurveyTransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SurveyTransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSurveyTransactionsRecordData({
  DocumentReference? fKSurvey,
  DocumentReference? fKUser,
  int? userResponse,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'FK_survey': fKSurvey,
      'FK_user': fKUser,
      'user_response': userResponse,
    }.withoutNulls,
  );

  return firestoreData;
}

class SurveyTransactionsRecordDocumentEquality
    implements Equality<SurveyTransactionsRecord> {
  const SurveyTransactionsRecordDocumentEquality();

  @override
  bool equals(SurveyTransactionsRecord? e1, SurveyTransactionsRecord? e2) {
    return e1?.fKSurvey == e2?.fKSurvey &&
        e1?.fKUser == e2?.fKUser &&
        e1?.userResponse == e2?.userResponse;
  }

  @override
  int hash(SurveyTransactionsRecord? e) =>
      const ListEquality().hash([e?.fKSurvey, e?.fKUser, e?.userResponse]);

  @override
  bool isValidKey(Object? o) => o is SurveyTransactionsRecord;
}
