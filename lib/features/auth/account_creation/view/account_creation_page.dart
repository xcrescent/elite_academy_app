import 'package:auto_route/auto_route.dart';
import 'package:elite_academy/core/theme/app_style.dart';
import 'package:elite_academy/core/utils/color_constant.dart';
import 'package:elite_academy/core/utils/image_constant.dart';
import 'package:elite_academy/core/utils/size_utils.dart';
import 'package:elite_academy/shared/widget/custom_button.dart';
import 'package:elite_academy/shared/widget/custom_icon_button.dart';
import 'package:elite_academy/shared/widget/custom_image_view.dart';
import 'package:elite_academy/shared/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AccountCreationScreen extends StatelessWidget {
  const AccountCreationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController group10198Controller = TextEditingController();
    TextEditingController group10198OneController = TextEditingController();
    TextEditingController group10198TwoController = TextEditingController();
    TextEditingController group10198ThreeController = TextEditingController();
    TextEditingController group10198FourController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray50,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: formKey,
          child: Container(
            width: double.maxFinite,
            padding: getPadding(
              left: 16,
              top: 24,
              right: 16,
              bottom: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: getSize(
                      150,
                    ),
                    width: getSize(
                      150,
                    ),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgEllipse5150x150,
                          height: getSize(
                            150,
                          ),
                          width: getSize(
                            150,
                          ),
                          radius: BorderRadius.circular(
                            getHorizontalSize(
                              75,
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                        CustomIconButton(
                          height: 30,
                          width: 30,
                          margin: getMargin(
                            top: 5,
                            right: 2,
                          ),
                          variant: IconButtonVariant.FillBlueA700,
                          shape: IconButtonShape.CircleBorder15,
                          padding: IconButtonPadding.PaddingAll4,
                          alignment: Alignment.topRight,
                          child: CustomImageView(
                            svgPath: ImageConstant.imgForward,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 26,
                  ),
                  child: Text(
                    "First Name",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtGilroyMedium16,
                  ),
                ),
                CustomTextFormField(
                  focusNode: FocusNode(),
                  controller: group10198Controller,
                  hintText: "Enter First Name",
                  margin: getMargin(
                    top: 8,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 19,
                  ),
                  child: Text(
                    "Last Name",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtGilroyMedium16,
                  ),
                ),
                CustomTextFormField(
                  focusNode: FocusNode(),
                  controller: group10198OneController,
                  hintText: "Enter Last Name",
                  margin: getMargin(
                    top: 7,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 18,
                  ),
                  child: Text(
                    "Mobile Number",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtGilroyMedium16,
                  ),
                ),
                CustomTextFormField(
                  focusNode: FocusNode(),
                  controller: group10198TwoController,
                  hintText: "Enter Mobile Number",
                  margin: getMargin(
                    top: 8,
                  ),
                  textInputType: TextInputType.phone,
                ),
                Padding(
                  padding: getPadding(
                    top: 18,
                  ),
                  child: Text(
                    "Email Id",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtGilroyMedium16,
                  ),
                ),
                CustomTextFormField(
                  focusNode: FocusNode(),
                  controller: group10198ThreeController,
                  hintText: "Enter Email Id",
                  margin: getMargin(
                    top: 8,
                  ),
                  textInputType: TextInputType.emailAddress,
                ),
                Padding(
                  padding: getPadding(
                    top: 18,
                  ),
                  child: Text(
                    "Set Password",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtGilroyMedium16,
                  ),
                ),
                CustomTextFormField(
                  focusNode: FocusNode(),
                  controller: group10198FourController,
                  hintText: "Set Password",
                  margin: getMargin(
                    top: 8,
                  ),
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  isObscureText: true,
                ),
                CustomButton(
                  height: getVerticalSize(
                    50,
                  ),
                  text: "Create Account",
                  margin: getMargin(
                    top: 24,
                    bottom: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
