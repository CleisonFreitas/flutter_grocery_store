import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_colors.dart';

class GoBackButton extends StatefulWidget {
  const GoBackButton({super.key});

  @override
  State<GoBackButton> createState() => _GoBackButtonState();
}

class _GoBackButtonState extends State<GoBackButton> {
  Color hoverColor = AppColors.darkContext;

  void _changeHoverColor(bool isHovered) {
    setState(() {
      hoverColor = isHovered ? AppColors.main : AppColors.darkContext;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios_sharp,
        color: hoverColor,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      hoverColor: AppColors.labelColor,
      onHover: _changeHoverColor,
    );
  }
}
