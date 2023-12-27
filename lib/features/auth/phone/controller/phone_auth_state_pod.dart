import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../features/auth/auth.dart';

/// This provider holds AuthNotifier
final phoneAuthPod = NotifierProvider<PhoneAuthNotifier, int>(
  PhoneAuthNotifier.new,
  name: 'authPod',
);

///This provider used to seup the intial value
///which can be overriden for test
final intialPhoneAuthValuePod = Provider((ref) => 0);
