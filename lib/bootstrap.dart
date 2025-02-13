import 'dart:async';
import 'dart:developer';

import 'package:elite_academy/core/local_storage/app_storage_pod.dart';
import 'package:elite_academy/init.dart';
import 'package:elite_academy/shared/riverpod_ext/riverpod_observer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:platform_info/platform_info.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'data/model/admin_model.dart';
import 'data/model/attendance_model.dart';
import 'data/model/batch_model.dart';
import 'data/model/fee_model.dart';
import 'data/model/org_model.dart';
import 'data/model/staff_model.dart';
import 'data/model/student_model.dart';

// coverage:ignore-file

/// This `talker` global variable used for logging and accessible
///  to other classed or function
// coverage:ignore-file

final talker = TalkerFlutter.init(
  settings: TalkerSettings(
    // maxHistoryItems:
    useConsoleLogs: !kReleaseMode,
    enabled: !kReleaseMode,
  ),
  logger: TalkerLogger(
    output: debugPrint,
    settings: TalkerLoggerSettings(
      enableColors: !Platform.I.iOS,
    ),
  ),
);

///This bootstrap function builds widget asynchronusly
///where builder function used for building your start widget.
///You can override riverpod providers ,also setup observers
///or you can put a provider container in parent
Future<void> bootstrap(
  FutureOr<Widget> Function() builder, {
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
  ProviderContainer? parent,
}) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(init());
  await Hive.initFlutter();

  final appBox = await Hive.openBox('appBox');
  final adminBox = await Hive.openBox<AdminModel>('adminBox');
  final orgBox = await Hive.openBox<OrgModel>('orgBox');
  final batchBox = await Hive.openBox<BatchModel>('batchBox');
  final facultyBox = await Hive.openBox<StaffModel>('staffBox');
  final studentBox = await Hive.openBox<StudentModel>('studentBox');
  final feeBox = await Hive.openBox<FeeModel>('feeBox');
  final attendanceBox = await Hive.openBox<AttendanceModel>('attendanceBox');

  Hive.registerAdapter(AdminModelAdapter());
  Hive.registerAdapter(OrgModelAdapter());
  Hive.registerAdapter(BatchModelAdapter());
  Hive.registerAdapter(StaffModelAdapter());
  Hive.registerAdapter(StudentModelAdapter());
  Hive.registerAdapter(FeeModelAdapter());
  Hive.registerAdapter(AttendanceModelAdapter());

  runApp(
    ProviderScope(
      overrides: [
        appBoxProvider.overrideWithValue(appBox),
        ...overrides,
      ],
      observers: [
        MyObserverLogger(
          talker: talker,
        ),
        ...?observers,
      ],
      parent: parent,
      child: await builder(),
    ),
  );
}
