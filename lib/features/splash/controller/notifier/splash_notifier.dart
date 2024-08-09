import 'package:elite_academy/features/splash/controller/splash_state_pod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_notifier.g.dart';

@riverpod
class SplashNotifier extends _$SplashNotifier {
  @override
  Future<bool> build() async {
    await ref.read(videoPlayerControllerProvider.notifier).state.initialize();
    return true;
  }

  void play() async {
    ref.read(videoPlayerControllerProvider.notifier).state.play();
  }

  void pause() async {
    ref.read(videoPlayerControllerProvider.notifier).state.pause();
  }

  void dispose() async {
    ref.read(videoPlayerControllerProvider.notifier).state.dispose();
    state = const AsyncData(false);
  }
}
