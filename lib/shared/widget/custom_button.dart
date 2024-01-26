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
          prefixWidget ?? const SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
          suffixWidget ?? const SizedBox(),
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
      case ButtonPadding.paddingT15:
        return getPadding(
          top: 15,
          right: 15,
          bottom: 15,
        );
      case ButtonPadding.paddingAll6:
        return getPadding(
          all: 6,
        );
      case ButtonPadding.paddingAll9:
        return getPadding(
          all: 9,
        );
      case ButtonPadding.paddingT12:
        return getPadding(
          left: 12,
          top: 12,
          bottom: 12,
        );
      case ButtonPadding.paddingT6:
        return getPadding(
          top: 6,
          right: 6,
          bottom: 6,
        );
      case ButtonPadding.paddingT9:
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
      case ButtonVariant.fillBlueGray100:
        return ColorConstant.blueGray100;
      case ButtonVariant.outlineBlueA700_1:
        return ColorConstant.whiteA700;
      case ButtonVariant.fillIndigo50:
        return ColorConstant.indigo50;
      case ButtonVariant.outlineBlueA700_2:
        return ColorConstant.blue50;
      case ButtonVariant.outlineBlueGray40001:
        return ColorConstant.whiteA700;
      case ButtonVariant.outlineBlueA700_3:
        return ColorConstant.blue5001;
      case ButtonVariant.outlineBlueGray100:
        return ColorConstant.whiteA700;
      case ButtonVariant.fillBlack9007f:
        return ColorConstant.black9007f;
      case ButtonVariant.fillBlack90099:
        return ColorConstant.black90099;
      case ButtonVariant.outlineGray300:
        return ColorConstant.whiteA700;
      case ButtonVariant.fillBlue50:
        return ColorConstant.blue50;
      case ButtonVariant.outlineBlueA700:
      case ButtonVariant.outlineBlueGray300:
        return null;
      default:
        return ColorConstant.blueA700;
    }
  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariant.outlineBlueA700:
        return BorderSide(
          color: ColorConstant.blueA700,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.outlineBlueA700_1:
        return BorderSide(
          color: ColorConstant.blueA700,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.outlineBlueA700_2:
        return BorderSide(
          color: ColorConstant.blueA700,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.outlineBlueGray40001:
        return BorderSide(
          color: ColorConstant.blueGray40001,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.outlineBlueA700_3:
        return BorderSide(
          color: ColorConstant.blueA700,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.outlineBlueGray100:
        return BorderSide(
          color: ColorConstant.blueGray100,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.outlineBlueGray300:
        return BorderSide(
          color: ColorConstant.blueGray300,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.outlineGray300:
        return BorderSide(
          color: ColorConstant.gray300,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.fillBlueA700:
      case ButtonVariant.fillBlueGray100:
      case ButtonVariant.fillIndigo50:
      case ButtonVariant.fillBlack9007f:
      case ButtonVariant.fillBlack90099:
      case ButtonVariant.fillBlue50:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.circleBorder23:
        return BorderRadius.circular(
          getHorizontalSize(
            23.00,
          ),
        );
      case ButtonShape.customBorderBL10:
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
      case ButtonShape.circleBorder19:
        return BorderRadius.circular(
          getHorizontalSize(
            19.00,
          ),
        );
      case ButtonShape.roundedBorder10:
        return BorderRadius.circular(
          getHorizontalSize(
            10.00,
          ),
        );
      case ButtonShape.square:
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
      case ButtonFontStyle.gilroyMedium16BlueA700:
        return TextStyle(
          color: ColorConstant.blueA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.gilroyMedium14:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.gilroyMedium14BlueGray40001:
        return TextStyle(
          color: ColorConstant.blueGray40001,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.gilroyMedium14BlueA700:
        return TextStyle(
          color: ColorConstant.blueA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.gilroyMedium14Black900:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.gilroyMedium14BlueGray400:
        return TextStyle(
          color: ColorConstant.blueGray400,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.gilroyMedium16BlueGray200:
        return TextStyle(
          color: ColorConstant.blueGray200,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.gilroyBold14:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.gilroyRegular12:
        return TextStyle(
          color: ColorConstant.blueGray300,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.gilroyMedium12:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.robotoRegular16:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.gilroyMedium16Black90001:
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
  square,
  roundedBorder6,
  circleBorder23,
  customBorderBL10,
  circleBorder19,
  roundedBorder10,
}

enum ButtonPadding {
  paddingAll14,
  paddingT15,
  paddingAll6,
  paddingAll9,
  paddingT12,
  paddingT6,
  paddingT9,
}

enum ButtonVariant {
  fillBlueA700,
  outlineBlueA700,
  fillBlueGray100,
  outlineBlueA700_1,
  fillIndigo50,
  outlineBlueA700_2,
  outlineBlueGray40001,
  outlineBlueA700_3,
  outlineBlueGray100,
  fillBlack9007f,
  outlineBlueGray300,
  fillBlack90099,
  outlineGray300,
  fillBlue50,
}

enum ButtonFontStyle {
  gilroyMedium16,
  gilroyMedium16BlueA700,
  gilroyMedium14,
  gilroyMedium14BlueGray40001,
  gilroyMedium14BlueA700,
  gilroyMedium14Black900,
  gilroyMedium14BlueGray400,
  gilroyMedium16BlueGray200,
  gilroyBold14,
  gilroyRegular12,
  gilroyMedium12,
  robotoRegular16,
  gilroyMedium16Black90001,
}
