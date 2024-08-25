// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LiteracyLevelStruct extends FFFirebaseStruct {
  LiteracyLevelStruct({
    String? levelName,
    String? badgeImage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _levelName = levelName,
        _badgeImage = badgeImage,
        super(firestoreUtilData);

  // "level_name" field.
  String? _levelName;
  String get levelName => _levelName ?? '';
  set levelName(String? val) => _levelName = val;

  bool hasLevelName() => _levelName != null;

  // "badge_image" field.
  String? _badgeImage;
  String get badgeImage => _badgeImage ?? '';
  set badgeImage(String? val) => _badgeImage = val;

  bool hasBadgeImage() => _badgeImage != null;

  static LiteracyLevelStruct fromMap(Map<String, dynamic> data) =>
      LiteracyLevelStruct(
        levelName: data['level_name'] as String?,
        badgeImage: data['badge_image'] as String?,
      );

  static LiteracyLevelStruct? maybeFromMap(dynamic data) => data is Map
      ? LiteracyLevelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'level_name': _levelName,
        'badge_image': _badgeImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'level_name': serializeParam(
          _levelName,
          ParamType.String,
        ),
        'badge_image': serializeParam(
          _badgeImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static LiteracyLevelStruct fromSerializableMap(Map<String, dynamic> data) =>
      LiteracyLevelStruct(
        levelName: deserializeParam(
          data['level_name'],
          ParamType.String,
          false,
        ),
        badgeImage: deserializeParam(
          data['badge_image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LiteracyLevelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LiteracyLevelStruct &&
        levelName == other.levelName &&
        badgeImage == other.badgeImage;
  }

  @override
  int get hashCode => const ListEquality().hash([levelName, badgeImage]);
}

LiteracyLevelStruct createLiteracyLevelStruct({
  String? levelName,
  String? badgeImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LiteracyLevelStruct(
      levelName: levelName,
      badgeImage: badgeImage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LiteracyLevelStruct? updateLiteracyLevelStruct(
  LiteracyLevelStruct? literacyLevel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    literacyLevel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLiteracyLevelStructData(
  Map<String, dynamic> firestoreData,
  LiteracyLevelStruct? literacyLevel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (literacyLevel == null) {
    return;
  }
  if (literacyLevel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && literacyLevel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final literacyLevelData =
      getLiteracyLevelFirestoreData(literacyLevel, forFieldValue);
  final nestedData =
      literacyLevelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = literacyLevel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLiteracyLevelFirestoreData(
  LiteracyLevelStruct? literacyLevel, [
  bool forFieldValue = false,
]) {
  if (literacyLevel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(literacyLevel.toMap());

  // Add any Firestore field values
  literacyLevel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLiteracyLevelListFirestoreData(
  List<LiteracyLevelStruct>? literacyLevels,
) =>
    literacyLevels
        ?.map((e) => getLiteracyLevelFirestoreData(e, true))
        .toList() ??
    [];
