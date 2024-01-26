import 'package:auto_route/auto_route.dart';
import 'package:elite_academy/core/theme/app_style.dart';
import 'package:elite_academy/core/utils/color_constant.dart';
import 'package:elite_academy/core/utils/image_constant.dart';
import 'package:elite_academy/core/utils/size_utils.dart';
import 'package:elite_academy/features/auth/auth.dart';
import 'package:elite_academy/features/auth/phone/repository/phone_auth_repository.dart';
import 'package:elite_academy/shared/widget/custom_button.dart';
import 'package:elite_academy/shared/widget/custom_icon_button.dart';
import 'package:elite_academy/shared/widget/custom_image_view.dart';
import 'package:elite_academy/shared/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../phone/controller/phone_auth_state_pod.dart';

@RoutePage(
  deferredLoading: true,
)
class AccountCreationScreen extends ConsumerWidget {
  const AccountCreationScreen({super.key});

  static final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(phoneAuthNotifierProvider, (_, state) {
      if (state.isNewUser == false) {
        if (!context.mounted) return;
        context.router.replaceNamed('/home');
      }
    });

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
                  onChanged: (value) {
                    ref.read(firstNameProvider.notifier).state = value;
                  },
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
                  onChanged: (value) {
                    ref.read(lastNameProvider.notifier).state = value;
                  },
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
                    "Email Id",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtGilroyMedium16,
                  ),
                ),
                CustomTextFormField(
                  focusNode: FocusNode(),
                  onChanged: (value) {
                    ref.read(emailProvider.notifier).state = value;
                  },
                  hintText: "Enter Email Id",
                  margin: getMargin(
                    top: 8,
                  ),
                  textInputType: TextInputType.emailAddress,
                ),
                CustomButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      ref.read(phoneAuthRepositoryProvider).saveUser(
                            ref.watch(firstNameProvider),
                            ref.watch(middleNameProvider),
                            ref.watch(lastNameProvider),
                            ref.watch(emailProvider),
                          );
                    }
                  },
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
