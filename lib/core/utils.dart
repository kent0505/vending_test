import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/machine.dart';
import 'models/product.dart';

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
List<Product> productsList = [];

Future<List<Machine>> getModels() async {
  final box = await Hive.openBox('machinesbox');
  List data = box.get('machinesList') ?? [];
  machinesList = data.cast<Machine>();
  log(machinesList.length.toString());
  productsList = getProducts();
  return machinesList;
}

Future<List<Machine>> updateModels() async {
  final box = await Hive.openBox('machinesbox');
  box.put('machinesList', machinesList);
  machinesList = await box.get('machinesList');
  productsList = getProducts();
  return machinesList;
}

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

List<Product> getProducts() {
  List<Product> products = [];
  for (Machine machine in machinesList) {
    for (Product product in machine.products) {
      products.add(product);
    }
  }
  return products;
}

String getProductName(Product product) {
  for (Machine machine in machinesList) {
    if (product.id == machine.id) {
      return machine.name;
    }
  }
  return '';
}

String getProductType(Product product) {
  for (Machine machine in machinesList) {
    if (product.id == machine.id) {
      return machine.type;
    }
  }
  return '';
}
