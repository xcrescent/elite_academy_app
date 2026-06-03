import 'package:elite_academy/data/model/admin_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notifier/admin_notifier.dart';

final adminStateNotifierProvider = StateNotifierProvider<AdminNotifier, List<AdminModel>>((ref) {
  return AdminNotifier();
});
