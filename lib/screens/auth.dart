import 'package:fc_hackathon_2024/data/constants.dart';
import 'package:fc_hackathon_2024/data/providers.dart';
import 'package:fc_hackathon_2024/main.dart';
import 'package:fc_hackathon_2024/screens/tab_container.dart';
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
    final rememberMe = ref.watch(rememberMeProvider);

    bool validate() => true;

    void authenticate({bool isNormalLogin = false}) async {
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isRegistering ? 'Hi, Welcome!' : 'Hi, Welcome Back!',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.waving_hand)
              ],
            ),
            const SizedBox(height: 20),
            if (isRegistering)
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Your Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            const SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter Your Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 15),
            if (isRegistering)
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Your Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            const SizedBox(height: 15),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Enter Your Password',
                suffixIcon: const Icon(Icons.visibility_off),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (value) => ref
                          .read(rememberMeProvider.notifier)
                          .state = value ?? false,
                    ),
                    const Text("Remember Me"),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => authenticate(isNormalLogin: true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: isLoading
                    ? const LoadingIndicator(color: Colors.white)
                    : Text(
                        isRegistering ? 'Sign Up' : 'Login',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 30),
            const Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Or With'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: authenticate,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  side: const BorderSide(color: Colors.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Stack(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(Icons.facebook, color: Colors.blue),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: isLoading
                          ? const LoadingIndicator(color: Colors.blue)
                          : Text(
                              '${isRegistering ? "Sign Up" : "Login"} with Facebook',
                              style: const TextStyle(color: Colors.blue),
                            ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: authenticate,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  side: const BorderSide(color: Colors.red),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Stack(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(Icons.g_mobiledata, color: Colors.red),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: isLoading
                          ? const LoadingIndicator(color: Colors.red)
                          : Text(
                              '${isRegistering ? "Sign Up" : "Login"} with Google',
                              style: const TextStyle(color: Colors.red),
                            ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isRegistering
                      ? "Already have an account?"
                      : "Don't have an account?",
                ),
                TextButton(
                  onPressed: () =>
                      ref.read(authProvider.notifier).state = !isRegistering,
                  child: Text(isRegistering ? "Login" : "Register"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
