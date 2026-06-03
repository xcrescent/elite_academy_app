import 'package:elite_academy/features/auth/phone/model/phone_auth_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhoneAuthNotifier extends StateNotifier<PhoneAuthResponse> {
  PhoneAuthNotifier()
      : super(PhoneAuthResponse(
          user: null,
          error: null,
          isNewUser: false,
        ));

  void setResponse(PhoneAuthResponse response) {
    state = response;
  }
}
