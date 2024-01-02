import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:elite_academy/features/auth/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/splash/elite_academy.mp4")
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(
        milliseconds: 2400,
      ),
      () {
        if (kDebugMode) {
          context.router.replaceNamed(
            '/home',
          );
          return;
        }

        var user = ref.watch(authProvider).currentUser;
        var authStateChanges = ref.watch(authStateChangesProvider).value;
        final loggedIn = authStateChanges!.phoneNumber!.isNotEmpty;

        if (ref.watch(authStateChangesProvider).value != null || user != null) {
          context.router.replaceNamed(
            '/home',
          );
          return;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Please Login to continue ...",
            ),
          ),
        );
        context.router.replaceNamed(
          '/phone-auth',
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(authProvider).signOut();
              context.router.replaceNamed(
                '/phone-auth',
              );
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      drawerScrimColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                height: _controller.value.size.height,
                width: _controller.value.size.width,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
