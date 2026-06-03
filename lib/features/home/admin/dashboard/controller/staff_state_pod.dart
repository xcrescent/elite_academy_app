import 'package:elite_academy/data/model/staff_model.dart';
import 'package:elite_academy/data/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final staffControllerProvider = StateNotifierProvider<StaffController, StaffModel>((ref) {
  var x = ref.read(userRepositoryProvider).getOrgId();
  return StaffController(x);
});

class StaffController extends StateNotifier<StaffModel> {
  StaffController(Future<String> x)
      : super(
          StaffModel(
            name: "",
            phone: "",
            id: "",
            orgId: "",
          ),
        ) {
    x.then((value) => state.orgId = value);
  }

  void setName(String name) {
    state.name = name;
  }

  // void setLastName(String lastName) {
  //   state.lastName = lastName;
  // }

  void setPhoneNumber(String phoneNumber) {
    state.phone = phoneNumber;
  }
}
