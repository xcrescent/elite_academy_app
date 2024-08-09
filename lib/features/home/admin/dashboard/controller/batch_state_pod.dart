import 'package:elite_academy/data/model/batch_model.dart';
import 'package:elite_academy/data/repository/batch_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final AutoDisposeStreamProvider<List<BatchModel>> batchListPod =
    StreamProvider.autoDispose<List<BatchModel>>(
  (ref) {
    return ref.read(batchRepositoryProvider).getAllBatch();
  },
);

// final batchControllerProvider = StateNotifierProvider<BatchController, BatchModel>((ref) {
//
// });

enum FeeType {
  monthly,
  quarterly,
  halfYearly,
  yearly,
  oneTime,
}

final List<Map<FeeType, String>> feeType = [
  {FeeType.monthly: "Monthly"},
  {FeeType.quarterly: "Quarterly"},
  {FeeType.halfYearly: "Half Yearly"},
  {FeeType.yearly: "Yearly"},
  {FeeType.oneTime: "One Time"},
];

// class BatchController extends StateNotifier<BatchModel> {
//   BatchController(Future<String> x)
//       : super(
//
//         ) {
//     x.then((value) => state.orgId = value);
//   }
//
//
// }
