import 'package:auto_route/auto_route.dart';
import 'package:elite_academy/core/theme/app_style.dart';
import 'package:elite_academy/core/utils/color_constant.dart';
import 'package:elite_academy/core/utils/size_utils.dart';
import 'package:elite_academy/features/auth/auth.dart';
import 'package:elite_academy/features/auth/phone/controller/phone_auth_state_pod.dart';
import 'package:elite_academy/features/auth/phone/repository/phone_auth_repository.dart';
import 'package:elite_academy/shared/widget/app_bar/appbar_subtitle.dart';
import 'package:elite_academy/shared/widget/app_bar/custom_app_bar.dart';
import 'package:elite_academy/shared/widget/custom_button.dart';
import 'package:elite_academy/shared/widget/custom_text_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class PhoneAuthPage extends ConsumerWidget {
  const PhoneAuthPage({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authStateNotifierProvider, (_, state) {
      if (state == AuthState.authenticating) {
        context.router.pushNamed('/phone-verify');
      } else {
        if (kDebugMode) {
          print("state: $state");
        }
      }
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray50,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          height: getVerticalSize(54),
          centerTitle: true,
          title: AppbarSubtitle(
            text: "Login using Phone Number",
          ),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: getPadding(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Phone Number",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtGilroyMedium16,
                ),
                CustomTextFormField(
                  focusNode: FocusNode(),
                  onChanged: (value) {
                    ref.read(phoneNumberProvider.notifier).state = value;
                  },
                  hintText: "Enter your Phone Number",
                  margin: getMargin(top: 7),
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.phone,
                ),
                CustomButton(
                  height: getVerticalSize(50),
                  text: "Get OTP",
                  margin: getMargin(
                    top: 24,
                    bottom: 5,
                  ),
                  onTap: () {
                    // if (kDebugMode) {
                    //   context.router.replace(
                    //       PhoneVerificationRoute(verificationId: "123456"));
                    //   //
                    //   return;
                    // }
                    if (_formKey.currentState!.validate()) {
                      // sendOTP(context, ref);
                      String phoneNumber =
                          '+91${ref.watch(phoneNumberProvider).trim()}';
                      ref
                          .read(phoneAuthRepositoryProvider)
                          .sendOtp(
                            phoneNumber,
                          )
                          .then((e) {
                        if (e != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(e),
                            ),
                          );
                        }
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
