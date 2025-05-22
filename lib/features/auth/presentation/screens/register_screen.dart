import 'package:caretutors/core/constants/app_colors.dart';
import 'package:caretutors/features/auth/presentation/controllers/auth_controller.dart';
import 'package:caretutors/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _nameController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator:
                      (value) => value!.isEmpty ? 'Please enter name' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator:
                      (value) => value!.isEmpty ? 'Please enter email' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator:
                      (value) =>
                          value!.isEmpty ? 'Please enter password' : null,
                ),
                const SizedBox(height: 24),
                Obx(
                  () => AuthButton(
                    text: 'Register',
                    isLoading: authController.isLoading.value,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        authController.signUp(
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                          _nameController.text.trim(),
                        );
                      }
                    },
                  ),
                ),
                TextButton(
                  onPressed: () => Get.toNamed('/login'),
                  child: const Text('Already have an account? Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
