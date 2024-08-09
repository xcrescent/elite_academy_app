import 'package:auto_route/auto_route.dart';
import 'package:elite_academy/const/color_constant.dart';
import 'package:elite_academy/core/utils/size_utils.dart';
import 'package:elite_academy/data/repository/auth_repository.dart';
import 'package:elite_academy/features/auth/phone/controller/phone_auth_state_pod.dart';
import 'package:elite_academy/shared/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class PhoneAuthPage extends HookConsumerWidget {
  const PhoneAuthPage({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final authNotifier = ref.watch(authNotifierProvider);
    // useEffect(() {
    //   if (authNotifier is User) {
    //     context.router.pushNamed('/phone-verify');
    //   }
    //   return () {};
    // }, [authNotifier]);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Sign In",
          ),
          actions: [],
        ),
        body: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Phone Number",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: ColorConstant.gray900,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  focusNode: FocusNode(),
                  controller: ref.watch(phoneNumberControllerPod),
                  decoration: InputDecoration(
                    hintText: "Enter your Phone Number",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                ),
                CustomButton(
                  height: getVerticalSize(50),
                  text: "Get OTP",
                  margin: getMargin(
                    top: 24,
                    bottom: 5,
                  ),
                  onTap: () async {
                    // if (kDebugMode) {
                    //   context.router.replace(
                    //       PhoneVerificationRoute(verificationId: "123456"));
                    //   //
                    //   return;
                    // }
                    if (_formKey.currentState!.validate()) {
                      // sendOTP(context, ref);
                      String phoneNumber =
                          '+91${ref.read(phoneNumberControllerPod.notifier).state.text.trim()}';
                      var e = await ref.read(authRepositoryProvider).sendOtp(
                            phoneNumber,
                          );

                      if (e != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(e),
                          ),
                        );
                      }
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
