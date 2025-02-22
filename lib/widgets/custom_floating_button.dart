import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_colors.dart';

class CustomFloatingButton extends StatelessWidget {
  final IconData icon;
  final String? shape;
  final VoidCallback? action;

  const CustomFloatingButton({
    super.key,
    this.shape,
    this.action,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: action,
      splashColor: AppColors.primary,
      shape: const CircleBorder(eccentricity: BorderSide.strokeAlignCenter),
      backgroundColor: AppColors.primary,
      child: Icon(
        icon,
        color: AppColors.main,
      ),
    );
  }
}
