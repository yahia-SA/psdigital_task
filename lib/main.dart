import 'package:flutter/material.dart';
import 'package:psdigital_task/app.dart';
import 'package:psdigital_task/core/utils/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MainApp());
}

