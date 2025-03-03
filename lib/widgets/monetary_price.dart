import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_colors.dart';
import 'package:nt_app/constants/app_texts.dart';
import 'package:nt_app/helpers/money_formatter.dart';

class MonetaryPrice extends StatelessWidget {
  final double productCost;

  const MonetaryPrice({super.key, required this.productCost});

  @override
  Widget build(BuildContext context) {
    return Text(
      MoneyFormatter.getPrice(productCost),
      style: AppTexts.label.copyWith(
        color: AppColors.darkContext,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    );
  }
}
