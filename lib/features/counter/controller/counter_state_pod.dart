import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/counter/counter.dart';

/// This provider holds CounternNotifier
final counterPod = NotifierProvider<CounterNotifier, int>(
  CounterNotifier.new,
  name: 'counterPod',
);

final boolPodNotifier = NotifierProvider<BoolPodNotifier, bool>(
  BoolPodNotifier.new,
  name: 'boolPodNotifier',
);

///This provider used to setup the intial value
///which can be overriden for test
final intialCounterValuePod = Provider((ref) => 0);

final boolPod = Provider((ref) => false); // variable name
