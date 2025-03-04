import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_colors.dart';
import 'package:nt_app/constants/app_texts.dart';
import 'package:nt_app/helpers/mask_formatter.dart';
import 'package:nt_app/screens/number_validation_screen.dart';
import 'package:nt_app/widgets/custom_button.dart';
import 'package:nt_app/widgets/form_input.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _numberInputController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _numberInputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
        ),
        child: SingleChildScrollView(
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/images/mask_group.png',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                child: Flex(
                  direction: Axis.vertical,
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Get your groceries \nwith nectar',
                      style: AppTexts.medium,
                    ),
                    FormInput(
                      controller: _numberInputController,
                      prefix: '+55',
                      icon: Icons.phone_android_sharp,
                      keyboardType: TextInputType.phone,
                      maxLength: 16,
                      formatters: MaskFormatter.phoneFormatter(),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Or connect with social media',
                        textAlign: TextAlign.center,
                        style: AppTexts.label.copyWith(
                          color: AppColors.labelColor,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Flex(
                        direction: Axis.vertical,
                        spacing: 16,
                        children: <Widget>[
                          CustomButton(
                            color: AppColors.lightBlue,
                            action: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const NumberValidationScreen(),
                                ),
                              );
                            },
                            text: 'Continue with Google',
                            iconPath: 'assets/images/google.png',
                          ),
                          CustomButton(
                            text: 'Continue with Facebook',
                            action: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const NumberValidationScreen(),
                                ),
                              );
                            },
                            color: AppColors.darkBlue,
                            iconPath: 'assets/images/facebook.png',
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
