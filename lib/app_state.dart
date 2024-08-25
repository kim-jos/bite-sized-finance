import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _Levels = prefs
              .getStringList('ff_Levels')
              ?.map((x) {
                try {
                  return LiteracyLevelStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _Levels;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<LiteracyLevelStruct> _Levels = [
    LiteracyLevelStruct.fromSerializableMap(jsonDecode(
        '{\"level_name\":\"Novice\",\"badge_image\":\"https://firebasestorage.googleapis.com/v0/b/bite-sized-finance-h0fl9m.appspot.com/o/Screenshot%202024-08-25%20at%2000.21.16.png?alt=media&token=e75147ca-56c7-409b-9ef0-32f6cbf37c77\"}')),
    LiteracyLevelStruct.fromSerializableMap(jsonDecode(
        '{\"level_name\":\"Intermediate\",\"badge_image\":\"https://firebasestorage.googleapis.com/v0/b/bite-sized-finance-h0fl9m.appspot.com/o/silver-cup.png?alt=media&token=02cedc72-df81-4869-b027-5e478155113b\"}')),
    LiteracyLevelStruct.fromSerializableMap(jsonDecode(
        '{\"level_name\":\"Expert\",\"badge_image\":\"https://firebasestorage.googleapis.com/v0/b/bite-sized-finance-h0fl9m.appspot.com/o/gold-cup.png?alt=media&token=fd24bf91-3472-49ce-8a10-1b17a21a9ccf\"}'))
  ];
  List<LiteracyLevelStruct> get Levels => _Levels;
  set Levels(List<LiteracyLevelStruct> value) {
    _Levels = value;
    prefs.setStringList('ff_Levels', value.map((x) => x.serialize()).toList());
  }

  void addToLevels(LiteracyLevelStruct value) {
    Levels.add(value);
    prefs.setStringList(
        'ff_Levels', _Levels.map((x) => x.serialize()).toList());
  }

  void removeFromLevels(LiteracyLevelStruct value) {
    Levels.remove(value);
    prefs.setStringList(
        'ff_Levels', _Levels.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromLevels(int index) {
    Levels.removeAt(index);
    prefs.setStringList(
        'ff_Levels', _Levels.map((x) => x.serialize()).toList());
  }

  void updateLevelsAtIndex(
    int index,
    LiteracyLevelStruct Function(LiteracyLevelStruct) updateFn,
  ) {
    Levels[index] = updateFn(_Levels[index]);
    prefs.setStringList(
        'ff_Levels', _Levels.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInLevels(int index, LiteracyLevelStruct value) {
    Levels.insert(index, value);
    prefs.setStringList(
        'ff_Levels', _Levels.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
