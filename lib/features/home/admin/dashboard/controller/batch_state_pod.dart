import 'package:elite_academy/features/auth/phone/repository/user_repository.dart';
import 'package:elite_academy/features/home/admin/dashboard/repository/batch_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/batch_model.dart';

final AutoDisposeStreamProvider<List<BatchModel>> batchListPod =
    StreamProvider.autoDispose<List<BatchModel>>(
  (ref) {
    return ref.read(batchRepositoryProvider).getAllBatch();
  },
);

final batchControllerProvider =
    StateNotifierProvider<BatchController, BatchModel>((ref) {
  var x = ref.read(userRepositoryProvider).getOrgId();
  return BatchController(x);
});

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

class BatchController extends StateNotifier<BatchModel> {
  BatchController(Future<String> x)
      : super(
          BatchModel(
            name: "",
            id: "",
            orgId: "",
            feeType: feeType[0].values.first,
            startDate: null,
            endDate: null,
            fees: 0.0,
          ),
        ) {
    x.then((value) => state.orgId = value);
  }

  void setBatchName(String name) {
    state.name = name;
  }

  void setStartDate(DateTime startDate) {
    state.startDate = startDate;
  }

  void setEndDate(DateTime endDate) {
    state.endDate = endDate;
  }

  void setFees(double fees) {
    state.fees = fees;
  }

  void setFeeType(String feeType) {
    state.feeType = feeType;
  }

  void reset() {
    state = BatchModel(
      name: "",
      id: "",
      orgId: "",
      feeType: feeType[0].values.first,
      startDate: null,
      endDate: null,
      fees: 0.0,
    );
  }
}
