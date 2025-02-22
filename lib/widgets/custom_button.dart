import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_colors.dart';
import 'package:nt_app/constants/app_texts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback action;
  final Color color;
  final double width;
  final double height;
  final IconData? icon;
  final String? iconPath;

  const CustomButton(
      {super.key,
      required this.text,
      required this.action,
      required this.color,
      this.width = 353,
      this.height = 67,
      this.icon,
      this.iconPath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: action,
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.center,
          direction: Axis.horizontal,
          spacing: 32,
          children: <Widget>[
            if (icon != null) ...[
              Icon(icon, color: AppColors.secondary),
            ],
            if (iconPath != null) ...[
              Image.asset(iconPath!),
            ],
            Text(
              text,
              style: AppTexts.medium.copyWith(
                color: AppColors.secondary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
