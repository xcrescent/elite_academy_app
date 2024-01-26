import 'package:elite_academy/core/utils/color_constant.dart';
import 'package:elite_academy/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextFormFieldShape? shape;
  final TextFormFieldPadding? padding;
  final TextFormFieldVariant? variant;
  final TextFormFieldFontStyle? fontStyle;
  final Alignment? alignment;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? isObscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  const CustomTextFormField({
    super.key,
    this.shape,
    this.padding,
    this.variant,
    this.fontStyle,
    this.alignment,
    this.width,
    this.margin,
    this.controller,
    this.focusNode,
    this.isObscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  _buildTextFormFieldWidget() {
    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        focusNode: focusNode,
        style: _setFontStyle(),
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: _buildDecoration(),
        validator: validator,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      case TextFormFieldFontStyle.gilroyMedium16BlueA700:
        return TextStyle(
          color: ColorConstant.blueA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case TextFormFieldFontStyle.gilroyMedium14:
        return TextStyle(
          color: ColorConstant.blueGray400,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case TextFormFieldFontStyle.gilroyMedium16BlueGray900:
        return TextStyle(
          color: ColorConstant.blueGray900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
      case TextFormFieldFontStyle.gilroyRegular14:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.gilroySemiBold18:
        return TextStyle(
          color: ColorConstant.blueGray900,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w600,
        );
      case TextFormFieldFontStyle.gilroyRegular14BlueGray400:
        return TextStyle(
          color: ColorConstant.blueGray400,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.gilroySemiBold16:
        return TextStyle(
          color: ColorConstant.blueGray900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w600,
        );
      case TextFormFieldFontStyle.gilroyRegular14BlueGray300:
        return TextStyle(
          color: ColorConstant.blueGray300,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.gilroySemiBold18BlueA700:
        return TextStyle(
          color: ColorConstant.blueA700,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w600,
        );
      default:
        return TextStyle(
          color: ColorConstant.blueGray200,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      case TextFormFieldShape.customBorderTL6:
        return BorderRadius.only(
          topLeft: Radius.circular(
            getHorizontalSize(
              6.00,
            ),
          ),
          topRight: Radius.circular(
            getHorizontalSize(
              6.00,
            ),
          ),
          bottomLeft: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
          bottomRight: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
        );
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            6.00,
          ),
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case TextFormFieldVariant.fillBlue50:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.underLineBlueGray100:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstant.blueGray100,
          ),
        );
      case TextFormFieldVariant.outline:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.outlineIndigo100:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.indigo100,
            width: 1,
          ),
        );
      case TextFormFieldVariant.none:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.blueGray100,
            width: 1,
          ),
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      case TextFormFieldVariant.fillBlue50:
        return ColorConstant.blue50;
      case TextFormFieldVariant.outline:
        return ColorConstant.black90099;
      case TextFormFieldVariant.outlineIndigo100:
        return ColorConstant.whiteA700;
      default:
        return ColorConstant.whiteA700;
    }
  }

  _setFilled() {
    switch (variant) {
      case TextFormFieldVariant.fillBlue50:
        return true;
      case TextFormFieldVariant.underLineBlueGray100:
        return false;
      case TextFormFieldVariant.outline:
        return true;
      case TextFormFieldVariant.outlineIndigo100:
        return true;
      case TextFormFieldVariant.none:
        return false;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (padding) {
      case TextFormFieldPadding.paddingT20:
        return getPadding(
          left: 16,
          top: 20,
          right: 16,
          bottom: 20,
        );
      case TextFormFieldPadding.paddingT12:
        return getPadding(
          left: 12,
          top: 12,
          bottom: 12,
        );
      case TextFormFieldPadding.paddingT11:
        return getPadding(
          left: 8,
          top: 11,
          right: 8,
          bottom: 11,
        );
      case TextFormFieldPadding.paddingAll8:
        return getPadding(
          all: 8,
        );
      case TextFormFieldPadding.paddingT15:
        return getPadding(
          left: 15,
          top: 15,
          bottom: 15,
        );
      default:
        return getPadding(
          all: 12,
        );
    }
  }
}

enum TextFormFieldShape {
  roundedBorder6,
  customBorderTL6,
}

enum TextFormFieldPadding {
  paddingAll12,
  paddingT20,
  paddingT12,
  paddingT11,
  paddingAll8,
  paddingT15,
}

enum TextFormFieldVariant {
  none,
  outlineBlueGray100,
  fillBlue50,
  underLineBlueGray100,
  outline,
  outlineIndigo100,
}

enum TextFormFieldFontStyle {
  gilroyMedium16,
  gilroyMedium16BlueA700,
  gilroyMedium14,
  gilroyMedium16BlueGray900,
  gilroyRegular14,
  gilroySemiBold18,
  gilroyRegular14BlueGray400,
  gilroySemiBold16,
  gilroyRegular14BlueGray300,
  gilroySemiBold18BlueA700,
}
