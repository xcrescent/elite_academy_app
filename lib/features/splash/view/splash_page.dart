import 'package:auto_route/auto_route.dart';
import 'package:elite_academy/core/utils/color_constant.dart';
import 'package:elite_academy/core/utils/image_constant.dart';
import 'package:elite_academy/core/utils/size_utils.dart';
import 'package:elite_academy/features/auth/auth.dart';
import 'package:elite_academy/shared/widget/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(
      const Duration(
        seconds: 2,
      ),
      () {
        if (ref.watch(authStateChangesProvider).value != null) {
          context.router.replaceNamed(
            '/home',
          );
          return;
        }
        context.router.replaceNamed(
          '/phone-auth',
        );
      },
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray50,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 33,
            right: 33,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgVectorBlueA70034x360,
                height: getVerticalSize(
                  34,
                ),
                width: getHorizontalSize(
                  360,
                ),
                margin: getMargin(
                  bottom: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
