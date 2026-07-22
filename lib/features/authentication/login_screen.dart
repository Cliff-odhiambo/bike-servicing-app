import 'package:flutter/material.dart';

import '../../core/routes/app_routes.dart';
import '../../core/theme/app_text_styles.dart';
import '../../shared/widgets/app_text_field.dart';
import '../../shared/widgets/primary_button.dart';

import 'auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController authController = AuthController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });

    try {
      final error = await authController.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (error != null) {
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error),
          ),
        );

        return;
      }

      final role = await authController.getUserRole();

      if (!mounted) return;

      switch (role) {
        case "admin":
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.adminDashboard,
          );
          break;

        case "provider":
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.providerDashboard,
          );
          break;

        case "rider":
        default:
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.riderHome,
          );
          break;
      }
    } catch (_) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Something went wrong",
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
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
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.forgotPassword,
                    );
                  },
                  child: const Text(
                    "Forgot password?",
                  ),
                ),
              ),

              const SizedBox(height: 20),

              PrimaryButton(
                text: "Log in",
                isLoading: isLoading,
                onPressed: () => login(),
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.register,
                      );
                    },
                    child: const Text(
                      "Sign up",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}