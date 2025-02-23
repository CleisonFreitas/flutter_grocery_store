import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_colors.dart';
import 'package:nt_app/constants/app_texts.dart';
import 'package:nt_app/screens/location_screen.dart';
import 'package:nt_app/widgets/content_container.dart';
import 'package:nt_app/widgets/custom_floating_button.dart';
import 'package:nt_app/widgets/form_input.dart';
import 'package:nt_app/widgets/go_back_button.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _codeInputController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _codeInputController.dispose();
  }

  void _goNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LocationScreen(),
      ),
    );
  }

  void _showSnackBar() {
    const snack = SnackBar(
      content: Text('The code has been sent!'),
      duration: Duration(seconds: 1),
      backgroundColor: AppColors.primary,
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentContainer(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const GoBackButton(),
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  'Enter your 4-digit code',
                  style: AppTexts.medium,
                ),
                const SizedBox(height: 10),
                FormInput(
                  controller: _codeInputController,
                  label: 'Code',
                  autoFocus: true,
                  isNumeric: true,
                  maxLength: 4,
                  placeholder: '- - - -',
                ),
              ],
            ),
            Positioned(
              bottom: 14,
              child: TextButton(
                onPressed: _showSnackBar,
                child: Text(
                  'Resend the code',
                  style: AppTexts.label.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: CustomFloatingButton(
        icon: Icons.arrow_forward_ios_sharp,
        action: _goNextScreen,
      ),
    );
  }
}
