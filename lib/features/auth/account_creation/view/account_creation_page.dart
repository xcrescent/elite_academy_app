import 'package:auto_route/auto_route.dart';
import 'package:elite_academy/const/image_constant.dart';
import 'package:elite_academy/core/providers/firebase_provider.dart';
import 'package:elite_academy/core/utils/size_utils.dart';
import 'package:elite_academy/features/auth/auth.dart';
import 'package:elite_academy/shared/widget/custom_button.dart';
import 'package:elite_academy/shared/widget/custom_icon_button.dart';
import 'package:elite_academy/shared/widget/custom_image_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage(
  deferredLoading: true,
)
class AccountCreationScreen extends HookConsumerWidget {
  const AccountCreationScreen({super.key});

  static final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final authNotifier = ref.watch(authNotifierProvider);
    if (kDebugMode) {
      firstNameController.text = "Dev";
      lastNameController.text = "Elite";
      emailController.text = "dev@eliteacademy.co.in";
      passwordController.text = "123456";
    }
    useEffect(() {
      if (authNotifier.value is User) {
        print("Redirecting to Home Page");
        context.router.replaceNamed(
          '/home',
        );
      }

      return () {};
    }, [authNotifier]);

    return SafeArea(
      child: Scaffold(
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
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  focusNode: FocusNode(),
                  onChanged: (value) {
                    ref.read(firstNameProvider.notifier).state = value;
                  },
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    hintText: "Enter First Name",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "First Name is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  focusNode: FocusNode(),
                  onChanged: (value) {
                    ref.read(lastNameProvider.notifier).state = value;
                  },
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    hintText: "Enter Last Name",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Last Name is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  focusNode: FocusNode(),
                  onChanged: (value) {
                    ref.read(emailProvider.notifier).state = value;
                  },
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "Enter Email Id",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email Id is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  focusNode: FocusNode(),
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: "Enter Password",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                ),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      await ref.read(authProvider).createUserWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
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
