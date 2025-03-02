import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_colors.dart';
import 'package:nt_app/constants/app_texts.dart';
import 'package:nt_app/helpers/money_formatter.dart';
import 'package:nt_app/widgets/add_button.dart';

class CardProduct extends StatelessWidget {
  final String productName;
  final String productImage;
  final double productCost;

  const CardProduct({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productCost,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 180,
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: const Border(
          top: BorderSide(color: AppColors.cardBorderColor),
          left: BorderSide(color: AppColors.cardBorderColor),
          right: BorderSide(color: AppColors.cardBorderColor),
          bottom: BorderSide(color: AppColors.cardBorderColor),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(productImage),
          const SizedBox(height: 20),
          _ProductLegend(productName, 'pcs', '7'),
          const SizedBox(height: 20),
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 30,
            children: <Widget>[
              Text(
                MoneyFormatter.getPrice(productCost),
                style: AppTexts.label.copyWith(
                  color: AppColors.darkContext,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AddButton(action: () {}),
            ],
          )
        ],
      ),
    );
  }
}

class _ProductLegend extends StatelessWidget {
  final String productName;
  final String unitaryMetric;
  final String offer;
  const _ProductLegend(
    this.productName,
    this.unitaryMetric,
    this.offer,
  );

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
          ),
        ),
        const SizedBox(height: 2),
        Wrap(
          direction: Axis.horizontal,
          spacing: 2,
          children: <Widget>[
            Text(
              offer,
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
