import 'package:auto_route/auto_route.dart';
import 'package:elite_academy/const/routes.dart';
import 'package:elite_academy/core/utils/size_utils.dart';
import 'package:elite_academy/features/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage(
  deferredLoading: true,
)
class SignInScreen extends HookConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailSignInController = useTextEditingController();
    final passwordSignInController = useTextEditingController();
    final loading = useState<bool>(false);
    if (kDebugMode) {
      emailSignInController.text = "dev@eliteacademy.co.in";
      passwordSignInController.text = "123456";
      print("Email: ${emailSignInController.text}");
      print("Password: ${passwordSignInController.text}");
      print("Debug Mode");
    }
    final obscureText = useState<bool>(true);
    final authNotifier = ref.watch(authNotifierProvider);
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
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Sign In",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        body: Form(
          child: Container(
            width: double.maxFinite,
            padding: getPadding(left: 16, top: 34, right: 16, bottom: 34),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Email",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                TextFormField(
                  controller: emailSignInController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "Enter your Email",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(top: 28),
                  child: const Text(
                    "Password",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                TextFormField(
                  controller: passwordSignInController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        obscureText.value = !obscureText.value;
                      },
                      icon: const Icon(
                        Icons.visibility_off,
                      ),
                    ),
                  ),
                  obscureText: obscureText.value,
                ),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: Padding(
                //     padding: getPadding(
                //       top: 12,
                //       right: 6,
                //     ),
                //     child: const Text(
                //       "Forgot Password?",
                //       overflow: TextOverflow.ellipsis,
                //       textAlign: TextAlign.left,
                //       style: TextStyle(
                //         fontWeight: FontWeight.w500,
                //       ),
                //     ),
                //   ),
                // ),
                const Spacer(),
                ElevatedButton(
                  onPressed: loading.value
                      ? null
                      : () async {
                          loading.value = true;
                          try {
                            var res = await ref
                                .read(authNotifierProvider.notifier)
                                .signInWithEmailAndPassword(
                                  emailSignInController.text,
                                  passwordSignInController.text,
                                );

                            if (!res) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Invalid Email or Password"),
                                ),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.toString()),
                              ),
                            );
                          }
                          loading.value = false;
                        },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 24,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: loading.value
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : const Text(
                          "Sign In",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                ),
                const SizedBox(
                  height: 16,
                ),
                // Register Button
                ElevatedButton(
                  onPressed: loading.value
                      ? null
                      : () {
                          context.router.pushNamed(Routes.accountCreation);
                        },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 24,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Register",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: loading.value
                      ? null
                      : () async {
                          loading.value = true;
                          try {
                            await ref.read(authNotifierProvider.notifier).signInWithGoogle();
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.toString()),
                              ),
                            );
                          }
                          loading.value = false;
                        },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 24,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: loading.value
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : const Text(
                          "Sign In with Google",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
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
