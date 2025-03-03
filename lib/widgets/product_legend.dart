import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_colors.dart';
import 'package:nt_app/constants/app_texts.dart';

class ProductLegend extends StatelessWidget {
  final String productName;
  final String unitaryMetric;
  final int offer;
  final double titleSize;
  const ProductLegend({
    super.key,
    required this.productName,
    required this.unitaryMetric,
    required this.offer,
    required this.titleSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          productName,
          style: AppTexts.label.copyWith(
            color: AppColors.darkContext,
            fontWeight: FontWeight.bold,
            fontSize: titleSize,
          ),
        ),
        const SizedBox(height: 2),
        Wrap(
          direction: Axis.horizontal,
          spacing: 2,
          children: <Widget>[
            Text(
              '$offer',
              style: AppTexts.label.copyWith(
                color: AppColors.labelColor,
                fontWeight: FontWeight.w200,
              ),
            ),
            Text(
              unitaryMetric,
              style: AppTexts.label.copyWith(
                color: AppColors.labelColor,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
