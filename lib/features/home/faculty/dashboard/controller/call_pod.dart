import 'package:elite_academy/features/home/faculty/dashboard/controller/stream_client_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';

final callPod = FutureProvider((ref) async {
  print('Call Pod');
  final client = await ref.read(streamClientPod);
  print('Client: $client');
  final call = client.makeCall(callType: StreamCallType.development(), id: '345');
  print('Call: $call');
  await call.join();
  return call;
});
