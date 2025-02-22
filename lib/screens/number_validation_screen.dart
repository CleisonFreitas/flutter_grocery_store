import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_colors.dart';
import 'package:nt_app/constants/app_texts.dart';
import 'package:nt_app/screens/verification_screen.dart';
import 'package:nt_app/widgets/content_container.dart';
import 'package:nt_app/widgets/custom_floating_button.dart';
import 'package:nt_app/widgets/form_input.dart';
import 'package:nt_app/widgets/go_back_button.dart';

class NumberValidationScreen extends StatefulWidget {
  const NumberValidationScreen({super.key});

  @override
  State<NumberValidationScreen> createState() => _NumberValidationScreenState();
}

class _NumberValidationScreenState extends State<NumberValidationScreen> {
  final _numberInputController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _numberInputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const GoBackButton(),
            const SizedBox(
              height: 100,
            ),
            Text(
              'Enter your mobile number',
              textAlign: TextAlign.start,
              style: AppTexts.medium.copyWith(
                color: AppColors.darkContext,
              ),
            ),
            const SizedBox(height: 16),
            FormInput(
              label: 'Mobile Number',
              controller: _numberInputController,
              autoFocus: true,
              maxLength: 12,
              isNumeric: true,
              icon: Icons.phone_callback_outlined,
              keyboardType: TextInputType.number,
              prefix: '+55 ',
            )
          ],
        ),
      ),
      floatingActionButton: CustomFloatingButton(
        icon: Icons.arrow_forward_ios_sharp,
        action: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const VerificationScreen(),
            ),
          );
        },
      ),
    );
  }
}
