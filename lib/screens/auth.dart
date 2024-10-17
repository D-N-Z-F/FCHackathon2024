import 'package:fc_hackathon_2024/data/constants.dart';
import 'package:fc_hackathon_2024/data/providers.dart';
import 'package:fc_hackathon_2024/main.dart';
import 'package:fc_hackathon_2024/screens/tab_container.dart';
import 'package:fc_hackathon_2024/widgets/auth_field.dart';
import 'package:fc_hackathon_2024/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Auth extends ConsumerWidget {
  const Auth({super.key});

  static const route = "/auth";
  static const routeName = "Auth";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRegistering = ref.watch(authProvider);
    final isLoading = ref.watch(loadingProvider);
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final password2Controller = TextEditingController();

    bool validate() => true;

    void authenticate() async {
      ref.read(loadingProvider.notifier).state = true;
      await Future.delayed(Constants.defaultLoadTime);
      if (validate() && context.mounted) {
        context.go(TabContainer.route);
      } else {
        MainApp.showSnackbar();
      }
      ref.read(loadingProvider.notifier).state = false;
    }

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isRegistering ? "New here?" : "Welcome back!",
              style: const TextStyle(
                fontSize: Constants.fontLg,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              isRegistering
                  ? "Create your account here"
                  : "Enter your email and password to sign in",
              style: const TextStyle(fontSize: Constants.fontSm),
            ),
            if (isRegistering)
              AuthField(
                controller: usernameController,
                labelText: "Enter your username",
                hintText: "e.g John Doe",
              ),
            AuthField(
              controller: emailController,
              labelText: "Enter your email",
              hintText: "e.g johndoe@gmail.com",
            ),
            AuthField(
              controller: passwordController,
              labelText: "Enter your password",
              hintText: "e.g johndoe123",
              isPasswordField: true,
            ),
            if (isRegistering)
              AuthField(
                controller: password2Controller,
                labelText: "Confirm password",
                isPasswordField: true,
              ),
            TextButton(
              onPressed: () =>
                  ref.read(authProvider.notifier).state = !isRegistering,
              child: Text(
                isRegistering
                    ? "Already have an account? Sign In now!"
                    : "Don't have an account? Sign Up now!",
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: isLoading ? null : authenticate,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.orange,
                ),
                child: isLoading
                    ? const LoadingIndicator()
                    : Text(isRegistering ? "Register" : "Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
