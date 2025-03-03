import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_colors.dart';
import 'package:nt_app/constants/app_texts.dart';
import 'package:nt_app/enums/metric_enum.dart';
import 'package:nt_app/widgets/custom_button.dart';
import 'package:nt_app/widgets/monetary_price.dart';
import 'package:nt_app/widgets/personal_accordion.dart';
import 'package:nt_app/widgets/product_legend.dart';

class ProductDetailScreen extends StatefulWidget {
  final MetricEnum metric;
  final double productCost;

  const ProductDetailScreen({
    super.key,
    required this.metric,
    required this.productCost,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String get _metric => widget.metric.friendlyTitle;
  double get _productCost => widget.productCost;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.fruitBackGroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: AppColors.secondary),
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 271.44,
                decoration: const BoxDecoration(
                  color: AppColors.fruitBackGroundColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                alignment: Alignment.center,
                child: SizedBox(
                  height: 250,
                  child: Image.asset(
                    'assets/images/grocery_items/apple.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductLegend(
                          productName: 'Natural Red Apple',
                          unitaryMetric: _metric,
                          offer: 1,
                          titleSize: 22,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            size: 32,
                            color: AppColors.primary,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: <Widget>[
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove),
                              color: const Color.fromARGB(255, 137, 42, 42),
                            ),
                            Container(
                              height: 45.67,
                              width: 45.67,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16),
                                ),
                                border: Border.all(
                                  color: AppColors.cardBorderColor,
                                ),
                              ),
                              child: Text(
                                '1',
                                style: AppTexts.label.copyWith(
                                  color: AppColors.darkContext,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add),
                              color: AppColors.primary,
                            )
                          ],
                        ),
                        MonetaryPrice(productCost: _productCost)
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 5),
                    const PersonalAccordion(
                      title: 'Product Details',
                      description:
                          'This product is made with high-quality materials...',
                    ),
                    const Divider(),
                    const PersonalAccordion(
                      title: 'Nutritions',
                      description:
                          'This product is made with high-quality materials...',
                    ),
                    const Divider(),
                    const PersonalAccordion(
                      title: 'Review',
                      description:
                          'This product is made with high-quality materials...',
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      text: 'Add to Basket',
                      action: () {},
                      color: AppColors.primary,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
