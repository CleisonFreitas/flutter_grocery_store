import 'dart:async';

import 'package:flutter/material.dart';

class BannerSlide extends StatefulWidget {
  final PageController pageController;
  final List<String> images;

  const BannerSlide({
    super.key,
    required this.pageController,
    required this.images,
  });

  @override
  State<BannerSlide> createState() => _BannerSlideState();
}

class _BannerSlideState extends State<BannerSlide> {
  PageController get _pageController => widget.pageController;
  List<String> get _images => widget.images;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (mounted) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      height: 100,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: PageView.builder(
          controller: _pageController,
          itemCount: _images.length,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          itemBuilder: (context, index) {
            return Image.asset(
              _images[index],
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
