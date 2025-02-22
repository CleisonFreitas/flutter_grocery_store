import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_colors.dart';
import 'package:nt_app/constants/app_texts.dart';
import 'package:nt_app/screens/sign_in_screen.dart';
import 'package:nt_app/widgets/custom_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset('assets/images/image_logo.png'),
            const SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: AppTexts.title.copyWith(
                  color: AppColors.main,
                  fontSize: 48,
                ),
                children: const <InlineSpan>[
                  TextSpan(text: 'Welcome \n'),
                  TextSpan(text: 'to our store')
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Get your groceries in as fast as one hour',
              style: AppTexts.medium.copyWith(
                color: AppColors.main,
              ),
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Get Started',
              action: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                );
              },
              color: AppColors.primary,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
