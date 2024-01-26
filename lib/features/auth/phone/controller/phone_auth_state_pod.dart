import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/phone_auth_response_model.dart';
import '../phone.dart';

final phoneNumberProvider = StateProvider<String>((ref) => '');

final otpProvider = StateProvider<String>((ref) => '');
final verificationIdProvider = StateProvider<String>((ref) => '');

final phoneAuthNotifierProvider =
    StateNotifierProvider<PhoneAuthNotifier, PhoneAuthResponse>((ref) {
  return PhoneAuthNotifier();
});
