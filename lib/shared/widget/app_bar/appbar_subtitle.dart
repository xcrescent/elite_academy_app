import 'package:elite_academy/core/theme/app_style.dart';
import 'package:elite_academy/core/utils/color_constant.dart';
import 'package:flutter/material.dart';

class AppbarSubtitle extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final AppbarSubtitleVariant variant;

  const AppbarSubtitle({
    super.key,
    required this.text,
    this.margin,
    this.onTap,
    this.variant = AppbarSubtitleVariant.large,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: _getTextStyle(),
        ),
      ),
    );
  }

  TextStyle _getTextStyle() {
    switch (variant) {
      case AppbarSubtitleVariant.large:
        return AppStyle.txtGilroySemiBold24.copyWith(
          color: ColorConstant.blueGray900,
        );
      case AppbarSubtitleVariant.medium:
        return AppStyle.txtGilroySemiBold18.copyWith(
          color: ColorConstant.blueGray900,
        );
    }
  }
}

enum AppbarSubtitleVariant {
  large,
  medium,
}
