import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_colors.dart';

class ContentContainer extends StatelessWidget {
  final Widget child;
  const ContentContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.secondary,
        gradient: RadialGradient(
          colors: <Color>[
            AppColors.primary,
            AppColors.main,
          ],
          center: Alignment.topLeft,
          radius: 0.2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: child,
      ),
    );
  }
}
