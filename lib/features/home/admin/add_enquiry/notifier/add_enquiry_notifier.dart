import 'package:elite_academy/data/model/batch_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../dashboard/controller/batch_state_pod.dart';

part 'add_enquiry_notifier.g.dart';

@riverpod
class AddBatchNotifier extends _$AddBatchNotifier {
  // StudentController(Future<String> x)
  //     : super(
  //         StudentModel(
  //           name: "",
  //           phoneNumber: "",
  //           orgId: "",
  //           whatsappNumber: "",
  //           userName: "",
  //           address: "",
  //           email: "",
  //           enrollmentNumber: "",
  //           batchId: "",
  //           dateOfBirth: DateTime.now(),
  //           id: "",
  //           stream: "",
  //           studyIn: "",
  //         ),
  //       ) {
  //   x.then((value) => state.orgId = value);
  // }
  @override
  BatchModel build() {
    // var x = await ref.read(userRepositoryProvider).getOrgId();
//   return BatchController(x);
    return BatchModel(
      name: "",
      id: "",
      orgId: "",
      feeType: feeType[0].values.first,
      startDate: null,
      endDate: null,
      fees: 0.0,
    );
  }

  Future<void> setBatchName(String name) async {
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
