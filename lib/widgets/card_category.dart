import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_colors.dart';
import 'package:nt_app/constants/app_texts.dart';

class CardCategory extends StatelessWidget {
  final Color contentColor;
  final Color borderColor;
  final String imageContent;
  final String sessionName;
  const CardCategory({
    super.key,
    required this.contentColor,
    required this.borderColor,
    required this.imageContent,
    required this.sessionName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5),
      height: 180,
      width: 164.5,
      decoration: BoxDecoration(
        color: contentColor,
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Image.asset(
                imageContent,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                sessionName,
                textAlign: TextAlign.center,
                style: AppTexts.label.copyWith(
                  color: AppColors.darkContext,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
