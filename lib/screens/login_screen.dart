import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_colors.dart';
import 'package:nt_app/constants/app_texts.dart';
import 'package:nt_app/screens/home_screen.dart';
import 'package:nt_app/screens/register_screen.dart';
import 'package:nt_app/widgets/content_container.dart';
import 'package:nt_app/widgets/custom_button.dart';
import 'package:nt_app/widgets/form_input.dart';
import 'package:nt_app/widgets/form_password_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
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
              const Text('Loging', style: AppTexts.medium),
              Text(
                'Enter your email and password',
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
                      controller: _emailAddressController,
                      label: 'Email',
                      autoFocus: true,
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
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Forgot the password?',
                            style: AppTexts.label.copyWith(
                              color: AppColors.darkContext,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      text: 'Log In',
                      action: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      color: AppColors.primary,
                    ),
                    const SizedBox(height: 10),
                    Flex(
                      direction: Axis.horizontal,
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't have an account?",
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
                                  builder: (_) => const RegisterScreen(),
                                ),
                              );
                            },
                            child: RichText(
                              text: TextSpan(
                                text: 'Sign Up',
                                style: AppTexts.label.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
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
