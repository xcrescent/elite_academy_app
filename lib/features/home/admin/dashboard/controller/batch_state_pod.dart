import 'package:elite_academy/features/home/admin/dashboard/repository/batch_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/batch_model.dart';

final AutoDisposeStreamProvider<List<BatchModel>> batchListPod =
    StreamProvider.autoDispose<List<BatchModel>>(
  (ref) {
    return ref.read(batchRepositoryProvider).getAllBatch();
  },
);
