import 'package:auto_route/auto_route.dart';
import 'package:elite_academy/core/theme/app_style.dart';
import 'package:elite_academy/core/utils/color_constant.dart';
import 'package:elite_academy/core/utils/image_constant.dart';
import 'package:elite_academy/core/utils/size_utils.dart';
import 'package:elite_academy/shared/widget/app_bar/appbar_image.dart';
import 'package:elite_academy/shared/widget/app_bar/appbar_subtitle.dart';
import 'package:elite_academy/shared/widget/app_bar/custom_app_bar.dart';
import 'package:elite_academy/shared/widget/custom_button.dart';
import 'package:elite_academy/shared/widget/custom_image_view.dart';
import 'package:elite_academy/shared/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController group10198Controller = TextEditingController();

    TextEditingController group10198OneController = TextEditingController();

    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray50,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
            height: getVerticalSize(42),
            leadingWidth: 40,
            leading: AppbarImage(
                height: getSize(24),
                width: getSize(24),
                svgPath: ImageConstant.imgArrowleft,
                margin: getMargin(left: 16, bottom: 4),
                onTap: () {
                  onTapArrowleft109(context);
                }),
            centerTitle: true,
            title: AppbarSubtitle(text: "Sign in")),
        body: Form(
          key: formKey,
          child: Container(
            width: double.maxFinite,
            padding: getPadding(left: 16, top: 34, right: 16, bottom: 34),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Email",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtGilroyMedium16),
                CustomTextFormField(
                    focusNode: FocusNode(),
                    controller: group10198Controller,
                    hintText: "Enter Your Email",
                    margin: getMargin(top: 8),
                    textInputType: TextInputType.emailAddress),
                Padding(
                    padding: getPadding(top: 18),
                    child: Text("Password",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtGilroyMedium16)),
                CustomTextFormField(
                    focusNode: FocusNode(),
                    controller: group10198OneController,
                    hintText: "Enter Password",
                    margin: getMargin(top: 7),
                    padding: TextFormFieldPadding.PaddingT12,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    suffix: Container(
                        margin: getMargin(all: 12),
                        child: CustomImageView(svgPath: ImageConstant.imgEye)),
                    suffixConstraints:
                        BoxConstraints(maxHeight: getVerticalSize(44)),
                    isObscureText: true),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: getPadding(
                      top: 12,
                      right: 6,
                    ),
                    child: Text(
                      "Forgot Password?",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtGilroyMedium14BlueA700,
                    ),
                  ),
                ),
                CustomButton(
                  height: getVerticalSize(50),
                  text: "Sign in",
                  margin: getMargin(
                    top: 25,
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

  onTapArrowleft109(BuildContext context) {
    Navigator.pop(context);
  }
}
