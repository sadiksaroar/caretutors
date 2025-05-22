import 'package:caretutors/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final VoidCallback onPressed;

  const AuthButton({
    super.key,
    required this.text,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: isLoading ? null : onPressed,
      child:
          isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : Text(
                text,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
    );
  }
}
