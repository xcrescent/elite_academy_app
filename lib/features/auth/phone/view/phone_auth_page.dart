import 'package:auto_route/auto_route.dart';
import 'package:elite_academy/core/router/router.gr.dart';
import 'package:elite_academy/core/theme/app_style.dart';
import 'package:elite_academy/core/utils/color_constant.dart';
import 'package:elite_academy/core/utils/size_utils.dart';
import 'package:elite_academy/features/auth/auth.dart';
import 'package:elite_academy/shared/widget/app_bar/appbar_subtitle.dart';
import 'package:elite_academy/shared/widget/app_bar/custom_app_bar.dart';
import 'package:elite_academy/shared/widget/custom_button.dart';
import 'package:elite_academy/shared/widget/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class PhoneAuthPage extends ConsumerStatefulWidget {
  const PhoneAuthPage({super.key});

  @override
  ConsumerState<PhoneAuthPage> createState() {
    return _PhoneAuthPageState();
  }
}

class _PhoneAuthPageState extends ConsumerState<PhoneAuthPage> {
  final TextEditingController _phoneController = TextEditingController();
  // String appCheckToken = 'Waiting...';

  @override
  void initState() {
    super.initState();
    // FirebaseAppCheck.instance.getToken().then((value) {
    //   print('AppCheck token: $value');
    //   if (!context.mounted) return;
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('AppCheck token: $value'),
    //     ),
    //   );
    //   if (value != null) {
    //     appCheckToken = value;
    //   }
    // }).catchError((e) {
    //   print('AppCheck error: $e');
    //   if (!context.mounted) return;
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('AppCheck error: $e'),
    //     ),
    //   );
    // });

    // FirebaseAppCheck.instance.onTokenChange.listen((token) async {
    //   print('AppCheck token changed: $token');
    //   if (!context.mounted) return;
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('AppCheck token changed: $token'),
    //     ),
    //   );
    //   if (token != null) {
    //     appCheckToken = token;
    //   }
    // });

    // (() async => await sendAppCheckToken())();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray50,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          height: getVerticalSize(54),
          // leadingWidth: 40,
          // leading: AppbarImage(
          //   height: getSize(24),
          //   width: getSize(24),
          //   svgPath: ImageConstant.imgArrowleft,
          //   margin: getMargin(left: 16, top: 13, bottom: 17),
          //   onTap: () {
          //     context.router.pop();
          //   },
          // ),
          centerTitle: true,
          title: AppbarSubtitle(
            text: "Phone Login",
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
                  controller: _phoneController,
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
                    if (kDebugMode) {
                      context.router.replace(
                          PhoneVerificationRoute(verificationId: "123456"));
                      //
                      return;
                    }

                    if (_formKey.currentState!.validate()) {
                      sendOTP(context, ref);
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

  // Future<void> sendAppCheckToken() async {
  //   try {
  //     // final forceRefresh = _authRepository.getAppCheckToken() == null;
  //     final tokenAppCheck =
  //         await FirebaseAppCheck.instance.getToken(); // <-- Fail
  //     if (tokenAppCheck != null) {
  //       appCheckToken = tokenAppCheck;
  //       //   await Dio(
  //       //     BaseOptions(
  //       //       headers: {
  //       //         'X-Firebase-AppCheck': tokenAppCheck,
  //       //       },
  //       //     ),
  //       //   ).post(
  //       //     'http://192.168.29.111:3000/api/v1/verify-token',
  //       //     data: {
  //       //       'X-Firebase-AppCheck': tokenAppCheck,
  //       //     },
  //       //   );
  //     }
  //     print('AppCheck token: $tokenAppCheck');
  //     if (!context.mounted) return;
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('AppCheck token: $tokenAppCheck'),
  //       ),
  //     );
  //     // await _saveAppCheckToken(
  //     //   authRepository: _authRepository,
  //     //   token: tokenAppCheck,
  //     // );
  //   } catch (error, stackTrace) {
  //     print('AppCheck error: $error');
  //     if (!context.mounted) return;
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('AppCheck error: $error'),
  //       ),
  //     );
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('AppCheck error: ${stackTrace.toString()}}')),
  //     );
  //     // logger.d('#AppCheck: ⛔️ ERROR: $error');
  //   }
  // }

  void sendOTP(BuildContext context, WidgetRef ref) async {
    if (_phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a phone number'),
        ),
      );
      return;
    }
    final auth = ref.read(authProvider);
    // auth.setSettings(
    //   appVerificationDisabledForTesting: true,
    // );
    verificationCompleted(PhoneAuthCredential credential) async {
      await auth.signInWithCredential(credential);
      if (kDebugMode) {
        print(
            "Phone number automatically verified and user signed in: ${auth.currentUser!.uid}");
      }
      // if (!context.mounted) return;
      // context.router.pushNamed('/counter');
    }

    verificationFailed(FirebaseAuthException e) {
      if (kDebugMode) {
        print(
            'Phone number verification failed. Code: ${e.code}. Message: ${e.message}');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Phone number verification failed. Code: ${e.code}. Message: ${e.message}'),
        ),
      );
    }

    codeSent(String verificationId, [int? forceResendingToken]) async {
      if (kDebugMode) {
        print('Please check your phone for the verification code.');
      }
      // Store the verification ID somewhere (e.g., in a state management provider)
      // Navigate to the OTP verification screen and pass the verification ID
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('OTP sent successfully'),
        ),
      );
      context.router
          .push(PhoneVerificationRoute(verificationId: verificationId));
    }

    codeAutoRetrievalTimeout(String verificationId) {
      if (kDebugMode) {
        print('verification code: $verificationId');
      }

      // Auto-resolution timed out...
    }

    // Replace with your own phone number
    // String phoneNumber = '+919911168006';
    String phoneNumber = '+91${_phoneController.text.trim()}';

    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }
}
