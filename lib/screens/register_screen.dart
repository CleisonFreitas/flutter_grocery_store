import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_colors.dart';
import 'package:nt_app/constants/app_texts.dart';
import 'package:nt_app/screens/login_screen.dart';
import 'package:nt_app/widgets/content_container.dart';
import 'package:nt_app/widgets/custom_button.dart';
import 'package:nt_app/widgets/form_input.dart';
import 'package:nt_app/widgets/form_password_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _userNameController = TextEditingController();
  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _userNameController.dispose();
    _emailAddressController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ContentContainer(
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 100,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/mini_logo.png'),
                ),
              ),
              const Text('Sign Up', style: AppTexts.medium),
              Text(
                'Enter your credentials to continue',
                style: AppTexts.label.copyWith(
                  color: AppColors.labelColor,
                ),
              ),
              const SizedBox(height: 10),
              Form(
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 30,
                  children: <Widget>[
                    FormInput(
                      controller: _userNameController,
                      label: 'Username',
                      autoFocus: true,
                    ),
                    FormInput(
                      controller: _emailAddressController,
                      label: 'Email',
                    ),
                    const SizedBox(height: 30),
                    Column(
                      children: [
                        FormPasswordInput(
                          controller: _passwordController,
                          label: 'Password',
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'By continuing you agree to our ',
                                  style: AppTexts.label.copyWith(
                                    color: AppColors.labelColor,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Terms of Service',
                                  style: AppTexts.label.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                                TextSpan(
                                  text: ' and ',
                                  style: AppTexts.label.copyWith(
                                    color: AppColors.labelColor,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: AppTexts.label.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      text: 'Sign Up',
                      action: () {},
                      color: AppColors.primary,
                    ),
                    const SizedBox(height: 10),
                    Flex(
                      direction: Axis.horizontal,
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already have an account?",
                          style: AppTexts.label.copyWith(
                            color: AppColors.darkContext,
                          ),
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const LoginScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign In",
                              style: AppTexts.label.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
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
