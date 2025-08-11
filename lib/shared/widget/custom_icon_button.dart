import 'package:elite_academy/const/color_constant.dart';
import 'package:elite_academy/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconButtonShape? shape;
  final IconButtonPadding? padding;
  final IconButtonVariant? variant;
  final Alignment? alignment;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final Widget? child;
  final VoidCallback? onTap;
  const CustomIconButton({
    super.key,
    this.shape,
    this.padding,
    this.variant,
    this.alignment,
    this.margin,
    this.width,
    this.height,
    this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildIconButtonWidget(),
          )
        : _buildIconButtonWidget();
  }

  _buildIconButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: IconButton(
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        iconSize: getSize(height ?? 0),
        padding: const EdgeInsets.all(0),
        icon: Container(
          alignment: Alignment.center,
          width: getSize(width ?? 0),
          height: getSize(height ?? 0),
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: child,
        ),
        onPressed: onTap,
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
      gradient: _setGradient(),
      boxShadow: _setBoxShadow(),
    );
  }

  _setPadding() {
    switch (padding) {
      case IconButtonPadding.paddingAll4:
        return getPadding(
          all: 4,
        );
      case IconButtonPadding.paddingAll7:
        return getPadding(
          all: 7,
        );
      case IconButtonPadding.paddingAll1:
        return getPadding(
          all: 1,
        );
      case IconButtonPadding.paddingAll10:
        return getPadding(
          all: 10,
        );
      default:
        return getPadding(
          all: 14,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case IconButtonVariant.outlineBluegray400:
        return ColorConstant.whiteA700;
      case IconButtonVariant.outlineBlueA700:
        return ColorConstant.whiteA700;
      case IconButtonVariant.outlineBlack9004d:
        return ColorConstant.whiteA700;
      case IconButtonVariant.outlineBlack9004d1:
        return ColorConstant.redA200;
      case IconButtonVariant.outline:
        return ColorConstant.black90099;
      case IconButtonVariant.fillBlueA700:
        return ColorConstant.blueA700;
      case IconButtonVariant.outlineGray60019:
        return ColorConstant.whiteA700;
      case IconButtonVariant.fillWhiteA700:
        return ColorConstant.whiteA700;
      case IconButtonVariant.fillGray10001:
        return ColorConstant.gray10001;
      case IconButtonVariant.outlineGray80049:
        return ColorConstant.whiteA700;
      case IconButtonVariant.fillBluegray30087:
        return ColorConstant.blueGray30087;
      case IconButtonVariant.fillGray30001:
        return ColorConstant.gray30001;
      case IconButtonVariant.fillBlue50:
        return ColorConstant.blue50;
      case IconButtonVariant.gradientBlack90066Black90066:
      case IconButtonVariant.outlineGray100:
      case IconButtonVariant.outlineBluegray10087:
      case IconButtonVariant.outlineBlueA7001:
        return null;
      default:
        return ColorConstant.whiteA700;
    }
  }

  _setBorder() {
    switch (variant) {
      case IconButtonVariant.outlineBluegray400:
        return Border.all(
          color: ColorConstant.blueGray400,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case IconButtonVariant.outlineBlueA700:
        return Border.all(
          color: ColorConstant.blueA700,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case IconButtonVariant.outlineGray100:
        return Border.all(
          color: ColorConstant.gray100,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case IconButtonVariant.outlineBluegray10087:
        return Border.all(
          color: ColorConstant.blueGray10087,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case IconButtonVariant.outlineBlueA7001:
        return Border.all(
          color: ColorConstant.blueA700,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case IconButtonVariant.outlineGray80049:
        return Border.all(
          color: ColorConstant.gray80049,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case IconButtonVariant.gradientBlack90066Black90066:
      case IconButtonVariant.outlineBlack9004d:
      case IconButtonVariant.outlineBlack9004d1:
      case IconButtonVariant.fillBlueA700:
      case IconButtonVariant.outlineGray60019:
      case IconButtonVariant.fillWhiteA700:
      case IconButtonVariant.fillGray10001:
      case IconButtonVariant.fillBluegray30087:
      case IconButtonVariant.fillGray30001:
      case IconButtonVariant.fillBlue50:
        return null;
      default:
        return Border.all(
          color: ColorConstant.blueGray100,
          width: getHorizontalSize(
            1.00,
          ),
        );
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case IconButtonShape.circleBorder20:
        return BorderRadius.circular(
          getHorizontalSize(
            20.00,
          ),
        );
      case IconButtonShape.circleBorder32:
        return BorderRadius.circular(
          getHorizontalSize(
            32.00,
          ),
        );
      case IconButtonShape.roundedBorder2:
        return BorderRadius.circular(
          getHorizontalSize(
            2.00,
          ),
        );
      case IconButtonShape.circleBorder15:
        return BorderRadius.circular(
          getHorizontalSize(
            15.00,
          ),
        );
      case IconButtonShape.roundedBorder10:
        return BorderRadius.circular(
          getHorizontalSize(
            10.00,
          ),
        );
      case IconButtonShape.roundedBorder26:
        return BorderRadius.circular(
          getHorizontalSize(
            26.00,
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

  _setGradient() {
    switch (variant) {
      case IconButtonVariant.gradientBlack90066Black90066:
        return LinearGradient(
          begin: const Alignment(
            -0.11,
            0.47,
          ),
          end: const Alignment(
            1,
            0.47,
          ),
          colors: [
            ColorConstant.black90066,
            ColorConstant.black90066,
          ],
        );
      case IconButtonVariant.outlineBluegray100:
      case IconButtonVariant.outlineBluegray400:
      case IconButtonVariant.outlineBlueA700:
      case IconButtonVariant.outlineBlack9004d:
      case IconButtonVariant.outlineBlack9004d1:
      case IconButtonVariant.outline:
      case IconButtonVariant.fillBlueA700:
      case IconButtonVariant.outlineGray100:
      case IconButtonVariant.outlineBluegray10087:
      case IconButtonVariant.outlineGray60019:
      case IconButtonVariant.fillWhiteA700:
      case IconButtonVariant.outlineBlueA7001:
      case IconButtonVariant.fillGray10001:
      case IconButtonVariant.outlineGray80049:
      case IconButtonVariant.fillBluegray30087:
      case IconButtonVariant.fillGray30001:
      case IconButtonVariant.fillBlue50:
        return null;
      default:
        return null;
    }
  }

  _setBoxShadow() {
    switch (variant) {
      case IconButtonVariant.outlineBlack9004d:
        return [
          BoxShadow(
            color: ColorConstant.black9004d,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: const Offset(
              0,
              3,
            ),
          ),
        ];
      case IconButtonVariant.outlineBlack9004d1:
        return [
          BoxShadow(
            color: ColorConstant.black9004d,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: const Offset(
              0,
              3,
            ),
          ),
        ];
      case IconButtonVariant.outlineGray60019:
        return [
          BoxShadow(
            color: ColorConstant.gray60019,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: const Offset(
              0,
              12,
            ),
          ),
        ];
      case IconButtonVariant.outlineBlueA7001:
        return [
          BoxShadow(
            color: ColorConstant.indigoA20033,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: const Offset(
              0,
              4,
            ),
          ),
        ];
      case IconButtonVariant.outlineBluegray100:
      case IconButtonVariant.gradientBlack90066Black90066:
      case IconButtonVariant.outlineBluegray400:
      case IconButtonVariant.outlineBlueA700:
      case IconButtonVariant.outline:
      case IconButtonVariant.fillBlueA700:
      case IconButtonVariant.outlineGray100:
      case IconButtonVariant.outlineBluegray10087:
      case IconButtonVariant.fillWhiteA700:
      case IconButtonVariant.fillGray10001:
      case IconButtonVariant.outlineGray80049:
      case IconButtonVariant.fillBluegray30087:
      case IconButtonVariant.fillGray30001:
      case IconButtonVariant.fillBlue50:
        return null;
      default:
        return null;
    }
  }
}

enum IconButtonShape {
  roundedBorder6,
  circleBorder20,
  circleBorder32,
  roundedBorder2,
  circleBorder15,
  roundedBorder10,
  roundedBorder26,
}

enum IconButtonPadding {
  paddingAll14,
  paddingAll4,
  paddingAll7,
  paddingAll1,
  paddingAll10,
}

enum IconButtonVariant {
  outlineBluegray100,
  gradientBlack90066Black90066,
  outlineBluegray400,
  outlineBlueA700,
  outlineBlack9004d,
  outlineBlack9004d1,
  outline,
  fillBlueA700,
  outlineGray100,
  outlineBluegray10087,
  outlineGray60019,
  fillWhiteA700,
  outlineBlueA7001,
  fillGray10001,
  outlineGray80049,
  fillBluegray30087,
  fillGray30001,
  fillBlue50,
}
