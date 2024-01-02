import 'package:elite_academy/core/utils/color_constant.dart';
import 'package:elite_academy/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final ButtonShape? shape;
  final ButtonPadding? padding;
  final ButtonVariant? variant;
  final ButtonFontStyle? fontStyle;
  final Alignment? alignment;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final String? text;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  const CustomButton(
      {super.key,
      this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget});

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        width ?? double.maxFinite,
        height ?? getVerticalSize(40),
      ),
      padding: _setPadding(),
      backgroundColor: _setColor(),
      side: _setTextButtonBorder(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingT15:
        return getPadding(
          top: 15,
          right: 15,
          bottom: 15,
        );
      case ButtonPadding.PaddingAll6:
        return getPadding(
          all: 6,
        );
      case ButtonPadding.PaddingAll9:
        return getPadding(
          all: 9,
        );
      case ButtonPadding.PaddingT12:
        return getPadding(
          left: 12,
          top: 12,
          bottom: 12,
        );
      case ButtonPadding.PaddingT6:
        return getPadding(
          top: 6,
          right: 6,
          bottom: 6,
        );
      case ButtonPadding.PaddingT9:
        return getPadding(
          top: 9,
          right: 9,
          bottom: 9,
        );
      default:
        return getPadding(
          all: 14,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.FillBluegray100:
        return ColorConstant.blueGray100;
      case ButtonVariant.OutlineBlueA700_1:
        return ColorConstant.whiteA700;
      case ButtonVariant.FillIndigo50:
        return ColorConstant.indigo50;
      case ButtonVariant.OutlineBlueA700_2:
        return ColorConstant.blue50;
      case ButtonVariant.OutlineBluegray40001:
        return ColorConstant.whiteA700;
      case ButtonVariant.OutlineBlueA700_3:
        return ColorConstant.blue5001;
      case ButtonVariant.OutlineBluegray100:
        return ColorConstant.whiteA700;
      case ButtonVariant.FillBlack9007f:
        return ColorConstant.black9007f;
      case ButtonVariant.FillBlack90099:
        return ColorConstant.black90099;
      case ButtonVariant.OutlineGray300:
        return ColorConstant.whiteA700;
      case ButtonVariant.FillBlue50:
        return ColorConstant.blue50;
      case ButtonVariant.OutlineBlueA700:
      case ButtonVariant.OutlineBluegray300:
        return null;
      default:
        return ColorConstant.blueA700;
    }
  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariant.OutlineBlueA700:
        return BorderSide(
          color: ColorConstant.blueA700,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineBlueA700_1:
        return BorderSide(
          color: ColorConstant.blueA700,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineBlueA700_2:
        return BorderSide(
          color: ColorConstant.blueA700,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineBluegray40001:
        return BorderSide(
          color: ColorConstant.blueGray40001,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineBlueA700_3:
        return BorderSide(
          color: ColorConstant.blueA700,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineBluegray100:
        return BorderSide(
          color: ColorConstant.blueGray100,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineBluegray300:
        return BorderSide(
          color: ColorConstant.blueGray300,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineGray300:
        return BorderSide(
          color: ColorConstant.gray300,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.FillBlueA700:
      case ButtonVariant.FillBluegray100:
      case ButtonVariant.FillIndigo50:
      case ButtonVariant.FillBlack9007f:
      case ButtonVariant.FillBlack90099:
      case ButtonVariant.FillBlue50:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.CircleBorder23:
        return BorderRadius.circular(
          getHorizontalSize(
            23.00,
          ),
        );
      case ButtonShape.CustomBorderBL10:
        return BorderRadius.only(
          topLeft: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
          topRight: Radius.circular(
            getHorizontalSize(
              10.00,
            ),
          ),
          bottomLeft: Radius.circular(
            getHorizontalSize(
              10.00,
            ),
          ),
          bottomRight: Radius.circular(
            getHorizontalSize(
              10.00,
            ),
          ),
        );
      case ButtonShape.CircleBorder19:
        return BorderRadius.circular(
          getHorizontalSize(
            19.00,
          ),
        );
      case ButtonShape.RoundedBorder10:
        return BorderRadius.circular(
          getHorizontalSize(
            10.00,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            6.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.GilroyMedium16BlueA700:
        return TextStyle(
          color: ColorConstant.blueA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.GilroyMedium14:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.GilroyMedium14Bluegray40001:
        return TextStyle(
          color: ColorConstant.blueGray40001,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.GilroyMedium14BlueA700:
        return TextStyle(
          color: ColorConstant.blueA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.GilroyMedium14Black900:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.GilroyMedium14Bluegray400:
        return TextStyle(
          color: ColorConstant.blueGray400,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.GilroyMedium16Bluegray200:
        return TextStyle(
          color: ColorConstant.blueGray200,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.GilroyBold14:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.GilroyRegular12:
        return TextStyle(
          color: ColorConstant.blueGray300,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.GilroyMedium12:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.RobotoRegular16:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.GilroyMedium16Black90001:
        return TextStyle(
          color: ColorConstant.black90001,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder6,
  CircleBorder23,
  CustomBorderBL10,
  CircleBorder19,
  RoundedBorder10,
}

enum ButtonPadding {
  PaddingAll14,
  PaddingT15,
  PaddingAll6,
  PaddingAll9,
  PaddingT12,
  PaddingT6,
  PaddingT9,
}

enum ButtonVariant {
  FillBlueA700,
  OutlineBlueA700,
  FillBluegray100,
  OutlineBlueA700_1,
  FillIndigo50,
  OutlineBlueA700_2,
  OutlineBluegray40001,
  OutlineBlueA700_3,
  OutlineBluegray100,
  FillBlack9007f,
  OutlineBluegray300,
  FillBlack90099,
  OutlineGray300,
  FillBlue50,
}

enum ButtonFontStyle {
  GilroyMedium16,
  GilroyMedium16BlueA700,
  GilroyMedium14,
  GilroyMedium14Bluegray40001,
  GilroyMedium14BlueA700,
  GilroyMedium14Black900,
  GilroyMedium14Bluegray400,
  GilroyMedium16Bluegray200,
  GilroyBold14,
  GilroyRegular12,
  GilroyMedium12,
  RobotoRegular16,
  GilroyMedium16Black90001,
}
