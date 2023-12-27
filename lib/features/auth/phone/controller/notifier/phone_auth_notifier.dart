import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../features/auth/auth.dart';

/// This notifier class used to build intial value
/// from intial counter value which can be overriden.

class PhoneAuthNotifier extends Notifier<int> {
  @override
  int build() {
    return ref.watch(intialPhoneAuthValuePod);
  }

  ///This function updates current state increase by 1
  void increment() => state = state + 1;

  ///This function updates current state decrease by 1
  void decrement() => state = state - 1;
}
