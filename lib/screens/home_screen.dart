import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_texts.dart';
import 'package:nt_app/enums/metric_enum.dart';
import 'package:nt_app/screens/product_detail_screen.dart';
import 'package:nt_app/widgets/banner_slide.dart';
import 'package:nt_app/widgets/card_product.dart';
import 'package:nt_app/widgets/categories.dart';
import 'package:nt_app/widgets/content_container.dart';
import 'package:nt_app/widgets/form_input.dart';
import 'package:nt_app/widgets/navigation_background.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  final _pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBackground(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ContentContainer(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/mini_logo.png'),
                const SizedBox(height: 10),
                const Wrap(
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  spacing: 5,
                  children: [
                    Icon(Icons.person),
                    Text(
                      'Olá, Cleison Freitas',
                      style: AppTexts.label,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                FormInput(
                  controller: _searchController,
                  icon: Icons.search,
                  isCircularInput: true,
                  placeholder: 'Search for a product',
                ),
                const SizedBox(height: 10),
                BannerSlide(
                  pageController: _pageController,
                  images: const [
                    'assets/images/banner.png',
                    'assets/images/banner_2.jpg',
                    'assets/images/banner_3.jpg'
                  ],
                ),
                const SizedBox(height: 20),
                Categories(categoriaName: 'Exclusive offer', action: () {}),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    child: Row(
                      spacing: 10,
                      children: [
                        CardProduct(
                          productName: 'Organic Bananas',
                          productImage:
                              'assets/images/grocery_items/banana.png',
                          productCost: 20,
                          metric: MetricEnum.kilogram,
                          quantity: 1,
                          action: () {},
                        ),
                        CardProduct(
                          productName: 'Red Apples',
                          productImage:
                              'assets/images/grocery_items/pepper.png',
                          productCost: 10.5,
                          metric: MetricEnum.kilogram,
                          quantity: 1,
                          action: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const ProductDetailScreen(
                                  metric: MetricEnum.kilogram,
                                  productCost: 10.5,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
