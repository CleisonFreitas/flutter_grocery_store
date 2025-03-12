import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_colors.dart';
import 'package:nt_app/widgets/card_category.dart';
import 'package:nt_app/widgets/form_input.dart';
import 'package:nt_app/widgets/navigation_background.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final _searchInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final fullWidth = MediaQuery.sizeOf(context).width;

    return NavigationBackground(
      title: 'Categorias',
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.secondary,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FormInput(
                controller: _searchInputController,
                isCircularInput: true,
                placeholder: 'Search Products',
                icon: Icons.search,
              ),
              const SizedBox(height: 16),
              Align(
                child: Wrap(
                  spacing: fullWidth > 400 ? 30 : 10,
                  runSpacing: 20,
                  alignment: WrapAlignment.spaceBetween,
                  children: const <Widget>[
                    CardCategory(
                      contentColor: AppColors.fruitVegetablesColor100,
                      borderColor: AppColors.fruitVegetablesColor600,
                      imageContent: 'assets/images/sessoes/diversos.png',
                      sessionName: 'Fresh Fruits & Vegetable',
                    ),
                    CardCategory(
                      contentColor: AppColors.oilColor100,
                      borderColor: AppColors.oilColor600,
                      imageContent: 'assets/images/sessoes/oil_items.png',
                      sessionName: 'Cooking Oil & Ghee',
                    ),
                    CardCategory(
                      contentColor: AppColors.meatFish100,
                      borderColor: Color.fromARGB(255, 205, 110, 8),
                      imageContent: 'assets/images/sessoes/meat_fish.png',
                      sessionName: 'Meat and fresh',
                    ),
                    CardCategory(
                      contentColor: AppColors.bakery100,
                      borderColor: AppColors.bakery600,
                      imageContent: 'assets/images/sessoes/padaria_items.png',
                      sessionName: 'Bakery & Snacks',
                    ),
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
