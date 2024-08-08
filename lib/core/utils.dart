import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/machine.dart';

bool onboard = true;

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('onboard');
  onboard = prefs.getBool('onboard') ?? true;
}

Future<void> saveData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('onboard', false);
}

List<Machine> machinesList = [];

Future<List<Machine>> getModels() async {
  final box = await Hive.openBox('machinesbox');
  List data = box.get('machinesList') ?? [];
  machinesList = data.cast<Machine>();
  log(machinesList.length.toString());
  return machinesList;
}

Future<List<Machine>> updateModels() async {
  final box = await Hive.openBox('machinesbox');
  box.put('machinesList', machinesList);
  machinesList = await box.get('machinesList');
  return machinesList;
}

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}
