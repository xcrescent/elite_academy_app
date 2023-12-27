import 'package:elite_academy/core/theme/app_style.dart';
import 'package:elite_academy/core/utils/color_constant.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarSubtitle7 extends StatelessWidget {
  AppbarSubtitle7({required this.text, this.margin, this.onTap});

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtGilroyRegular12Bluegray400.copyWith(
            color: ColorConstant.blueGray400,
          ),
        ),
      ),
    );
  }
}
