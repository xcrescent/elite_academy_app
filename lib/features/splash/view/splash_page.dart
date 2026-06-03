import 'package:auto_route/auto_route.dart';
import 'package:elite_academy/const/routes.dart';
import 'package:elite_academy/features/splash/controller/notifier/splash_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../core/providers/firebase_provider.dart';
import '../../auth/controller/notifier/auth_notifier.dart';
import '../controller/splash_state_pod.dart';

@RoutePage(
  deferredLoading: true,
)
class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authNotifierProvider);
    final videoPlayerController = ref.watch(videoPlayerControllerProvider);
    final videoPlayer = useMemoized(() => VideoPlayer(videoPlayerController));

    // Redirect to the home page if the user is already signed in.
    useEffect(() {
      if (authNotifier.value is User) {
        context.router.replaceNamed(Routes.home);
      } else {
        context.router.replaceNamed(Routes.signIn);
      }
      debugPrint('SplashScreen: ${authNotifier.value}');
      return () {
        // Cleanup
      };
    }, [authNotifier]);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      drawerScrimColor: Colors.transparent,
      extendBody: true,
      body: ref.watch(splashNotifierProvider).when(data: (data) {
        if (data) {
          ref.read(videoPlayerControllerProvider).play();
          return SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.fill,
              child: SizedBox(
                height: videoPlayerController.value.size.height,
                width: videoPlayerController.value.size.width,
                child: videoPlayer,
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      }, loading: () {
        // Don't show anything while the video is loading.
        return const SizedBox.shrink();
      }, error: (error, _) {
        return Center(
          child: Text(
            error.toString(),
          ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: authNotifier.value == null
          ? FloatingActionButton.extended(
              onPressed: () async {
                await ref.read(authProvider).signOut();
                context.router.replaceNamed(Routes.signIn);
              },
              label: const Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              icon: const Icon(Icons.login, color: Colors.white),
            )
          : null,
    );
  }
}
