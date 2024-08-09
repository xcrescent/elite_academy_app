import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

final videoPlayerControllerProvider = StateProvider<VideoPlayerController>((ref) {
  final controller = VideoPlayerController.asset("assets/splash/elite_academy.mp4");

  controller.setLooping(true);
  return controller;
});
