import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_colors.dart';
import 'package:nt_app/constants/app_texts.dart';

class Categories extends StatelessWidget {
  final String categoriaName;
  final VoidCallback action;

  const Categories({
    super.key,
    required this.categoriaName,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          categoriaName,
          style: AppTexts.medium.copyWith(
            color: AppColors.darkContext,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: action,
          child: Text(
            'See all',
            style: AppTexts.label.copyWith(
              color: AppColors.primary,
            ),
          ),
        )
      ],
    );
  }
}
