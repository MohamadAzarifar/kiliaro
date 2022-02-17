import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:kiliaro_test_album/core/common/utils/local_path.dart';
import 'package:kiliaro_test_album/features/test_album/data/tables/media/media_table.dart';

import 'di/get_it.dart' as get_it;
import 'kiliaro_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  Hive.init(await LocalPath.pathAppDocumentDirectory());
  Hive.registerAdapter(MediaTableAdapter());
  unawaited(get_it.init());
  runApp(const KiliaroApp());
}
