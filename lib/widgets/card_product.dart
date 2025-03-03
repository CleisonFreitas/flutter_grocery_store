import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_colors.dart';
import 'package:nt_app/constants/app_texts.dart';
import 'package:nt_app/enums/metric_enum.dart';
import 'package:nt_app/helpers/money_formatter.dart';
import 'package:nt_app/widgets/add_button.dart';
import 'package:nt_app/widgets/product_legend.dart';

class CardProduct extends StatelessWidget {
  final String productName;
  final String productImage;
  final double productCost;
  final MetricEnum metric;
  final int quantity;
  final VoidCallback action;

  const CardProduct({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productCost,
    required this.metric,
    required this.quantity,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 180,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            child: Image.asset(productImage),
          ),
          const SizedBox(height: 20),
          ProductLegend(
            productName: productName,
            offer: 1,
            titleSize: 16,
            unitaryMetric: metric.friendlyTitle,
          ),
          const SizedBox(height: 20),
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                MoneyFormatter.getPrice(productCost),
                style: AppTexts.label.copyWith(
                  color: AppColors.darkContext,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AddButton(action: action),
            ],
          )
        ],
      ),
    );
  }
}
