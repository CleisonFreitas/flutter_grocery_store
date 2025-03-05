import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_colors.dart';
import 'package:nt_app/constants/app_texts.dart';

class NavigationBackground extends StatefulWidget {
  final Widget body;

  const NavigationBackground({super.key, required this.body});

  @override
  State<NavigationBackground> createState() => _NavigationBackgroundState();
}

class _NavigationBackgroundState extends State<NavigationBackground> {
  int currentPageIndex = 0;
  Widget get _body => widget.body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: AppColors.fruitBackGroundColor,
        shadowColor: AppColors.darkContext,
        backgroundColor: AppColors.secondary,
        selectedIndex: currentPageIndex,
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return AppTexts.navigateTitle.copyWith(color: AppColors.primary);
            }
            return AppTexts.navigateTitle
                .copyWith(color: AppColors.darkContext);
          },
        ),
        destinations: <NavigationDestination>[
          _buildNavItem(0, Icons.local_mall, "Shop"),
          _buildNavItem(1, Icons.search_sharp, "Explore"),
          _buildNavItem(2, Icons.shopping_cart, "Cart", hasBadge: true),
          _buildNavItem(3, Icons.favorite, "Favorite", isBadge: true),
          _buildNavItem(4, Icons.person, "Account"),
        ],
      ),
      body: _body,
    );
  }

  NavigationDestination _buildNavItem(
    int index,
    IconData icon,
    String label, {
    bool hasBadge = false,
    bool isBadge = false,
    int badgeItems = 0,
  }) {
    currentPageIndex == index;
    return NavigationDestination(
      selectedIcon: Icon(icon, color: AppColors.primary),
      icon: hasBadge && badgeItems != 0
          ? Badge(label: Text('$badgeItems'), child: Icon(icon))
          : (isBadge ? Badge(child: Icon(icon)) : Icon(icon)),
      label: label,
    );
  }
}
