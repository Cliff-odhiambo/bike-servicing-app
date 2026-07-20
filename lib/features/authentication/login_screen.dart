import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/theme/app_text_styles.dart';
import '../../shared/widgets/app_text_field.dart';
import '../../shared/widgets/primary_button.dart';
import 'auth_service.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
  try {
    await AuthService.login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Login successful"),
      ),
    );

    // Dashboard navigation will be added here

  } on FirebaseAuthException catch (e) {

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          e.message ?? "Login failed",
        ),
      ),
    );

  } catch (e) {

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Something went wrong"),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(24),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const SizedBox(height: 70),

              Text(
                "Welcome back",
                style: AppTextStyles.heading,
              ),

              const SizedBox(height: 6),

              Text(
                "Log in to book your next service",
                style: AppTextStyles.subtitle,
              ),

              const SizedBox(height: 40),

              AppTextField(
                controller: emailController,
                label: "Email",
                hintText: "name@email.com",
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20),

              AppTextField(
                controller: passwordController,
                label: "Password",
                hintText: "********",
                obscureText: true,
              ),

              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgot password?"),
                ),
              ),

              const SizedBox(height: 20),

              PrimaryButton(
                text: "Log in",
                onPressed: login,
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Text("Don't have an account?"),

                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/register',
                      );
                    },
                    child: const Text("Sign up"),
                  ),

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}