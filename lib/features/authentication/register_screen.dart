import 'package:flutter/material.dart';

import '../../core/routes/app_routes.dart';
import '../../core/theme/app_text_styles.dart';
import '../../shared/widgets/app_text_field.dart';
import '../../shared/widgets/primary_button.dart';
import '../../core/validators/validators.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  String? confirmPasswordValidator(String? value) {

  if (value == null || value.isEmpty) {
    return "Please confirm your password";
  }

  if (value != passwordController.text) {
    return "Passwords do not match";
  }

  return null;
}
void register() {
  if (formKey.currentState?.validate() ?? false) {
    Navigator.pushReplacementNamed(context, '/home');
  }
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(),

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(24),

          child: Form(

            key: formKey,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(
                  "Create Account",
                  style: AppTextStyles.heading,
                ),

                const SizedBox(height: 8),

                Text(
                  "Create your account to continue",
                  style: AppTextStyles.subtitle,
                ),

                const SizedBox(height: 35),

                AppTextField(
                  controller: nameController,
                  label: "Full Name",
                  hintText: "John Doe",
                  validator: Validators.requiredField,
                ),

                const SizedBox(height: 20),

                AppTextField(
                  controller: emailController,
                  label: "Email",
                  hintText: "name@email.com",
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.email,
                ),

                const SizedBox(height: 20),

                AppTextField(
                  controller: phoneController,
                  label: "Phone Number",
                  hintText: "07XXXXXXXX",
                  keyboardType: TextInputType.phone,
                  validator: Validators.phone,
                ),

                const SizedBox(height: 20),

                AppTextField(
                  controller: passwordController,
                  label: "Password",
                  hintText: "********",
                  validator: Validators.password,
                  obscureText: obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 20),

                AppTextField(
                  controller: confirmPasswordController,
                  label: "Confirm Password",
                  hintText: "********",
                  validator: confirmPasswordValidator,
                  obscureText: obscureConfirmPassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureConfirmPassword =
                            !obscureConfirmPassword;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 35),

                PrimaryButton(
                  text: "Create Account",
                  onPressed: register,
                ),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const Text("Already have an account?"),

                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Log in"),
                    ),

                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}