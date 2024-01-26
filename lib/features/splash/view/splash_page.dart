import 'package:auto_route/auto_route.dart';
import 'package:elite_academy/features/auth/auth.dart';
import 'package:elite_academy/features/auth/phone/repository/phone_auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../core/providers/firebase_provider.dart';
import '../controller/splash_state_pod.dart';

@RoutePage()
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kDebugMode) {
      Future.delayed(
        const Duration(milliseconds: 1900),
        () {
          ref.read(authStateNotifierProvider.notifier).setAuthState(
                AuthState.authenticated,
              );

          context.router.replaceNamed(
            '/home',
          );
        },
      );
      return const SizedBox();
    }
    ref.listen<AuthState>(authStateNotifierProvider, (_, state) {
      if (state == AuthState.authenticated) {
        // if (ref.read(authProvider).currentUser!.role == 'admin') {
        //   ref.read(adminStateNotifierProvider.notifier).setAdminState(
        //         AdminState.admin,
        //       );
        // } else {
        //   ref.read(adminStateNotifierProvider.notifier).setAdminState(
        //         AdminState.notAdmin,
        //       );
        // }
        ref.read(phoneAuthRepositoryProvider).checkNewUser().then(
          (value) {
            if (value == true) {
              Future.delayed(const Duration(milliseconds: 1900), () {
                context.router.replaceNamed(
                  '/account-creation',
                );
              });
              return;
            }
            Future.delayed(
              const Duration(milliseconds: 1900),
              () {
                context.router.replaceNamed(
                  '/home',
                );
              },
            );
          },
        );
      } else if (state == AuthState.unauthenticated) {
        Future.delayed(const Duration(milliseconds: 2600), () {
          context.router.replaceNamed(
            '/phone-auth',
          );
        });
      } else if (state == AuthState.uninitialized) {
        context.router.replaceNamed(
          '/phone-auth',
        );
      }
    });

    // Trigger the authentication check as soon as the splash screen is built
    ref.read(authStateNotifierProvider.notifier).checkAuth();
    final videoPlayerController = ref.watch(videoPlayerProvider);

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   actions: [
      //
      //   ],
      // ),
      backgroundColor: Colors.black,
      drawerScrimColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
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
          ),
          videoPlayerController.value.isInitialized
              ? SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      height: videoPlayerController.value.size.height,
                      width: videoPlayerController.value.size.width,
                      child: VideoPlayer(videoPlayerController),
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ],
      ),
    );
  }
}
