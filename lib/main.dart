import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_manager/app.dart';
import 'package:task_manager/app_injector.dart';
import 'package:task_manager/core/debug/seed_data.dart';
import 'package:task_manager/data/datasources/local/db_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  setUpDependancies();

  await locator<DBService>().database;

  if (kDebugMode) {
    final db = locator<DBService>();

    final wipeDB = WipeDatabase(db);
    await wipeDB.wipe();

    final seedData = SeedData(db);
    await seedData.insertDummyData();
  }

  runApp(const App());
}
