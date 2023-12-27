import 'package:elite_academy/core/theme/app_decoration.dart';
import 'package:elite_academy/core/utils/size_utils.dart';
import 'package:elite_academy/shared/widget/custom_image_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarCircleimage1 extends StatelessWidget {
  AppbarCircleimage1({this.imagePath, this.svgPath, this.margin, this.onTap});

  String? imagePath;

  String? svgPath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadiusStyle.circleBorder25,
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          svgPath: svgPath,
          imagePath: imagePath,
          height: getSize(
            46,
          ),
          width: getSize(
            46,
          ),
          fit: BoxFit.contain,
          radius: BorderRadius.circular(
            getHorizontalSize(
              23,
            ),
          ),
        ),
      ),
    );
  }
}
