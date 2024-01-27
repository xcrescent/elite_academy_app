import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerNotifier extends StateNotifier<VideoPlayerController> {
  VideoPlayerNotifier()
      : super(VideoPlayerController.asset("assets/splash/elite_academy.mp4")) {
    state.initialize().then((_) {
      state.play();
      state.setLooping(true);
      // You may call stateChanged() if you need to rebuild the ConsumerWidget whenever the controller updates.
    });
  }

  @override
  void dispose() {
    state.dispose();
    super.dispose();
  }
}
