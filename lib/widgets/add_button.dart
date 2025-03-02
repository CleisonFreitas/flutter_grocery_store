import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_colors.dart';

class AddButton extends StatelessWidget {
  final VoidCallback action;
  const AddButton({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: IconButton(
        onPressed: action,
        icon: const Icon(Icons.add),
        color: AppColors.main,
      ),
    );
  }
}
