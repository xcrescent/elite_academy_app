import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import 'notifier/splash_notifier.dart';

final videoPlayerProvider =
    StateNotifierProvider<VideoPlayerNotifier, VideoPlayerController>(
  (ref) => VideoPlayerNotifier(),
);
