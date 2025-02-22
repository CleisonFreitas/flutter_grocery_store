import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_colors.dart';
import 'package:nt_app/constants/app_texts.dart';
import 'package:nt_app/widgets/content_container.dart';
import 'package:nt_app/widgets/custom_button.dart';
import 'package:nt_app/widgets/form_input.dart';
import 'package:nt_app/widgets/go_back_button.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final _textZoneController = TextEditingController();
  final _textAreaController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textAreaController.dispose();
    _textZoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const GoBackButton(),
            const SizedBox(height: 50),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/map_image.png'),
                  const SizedBox(height: 10),
                  const Text(
                    'Select Your Location',
                    style: AppTexts.medium,
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "Switch on your location to stay in tune with\nwhat's happening in your area",
                      textAlign: TextAlign.center,
                      style: AppTexts.label.copyWith(
                        color: AppColors.labelColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            FormInput(
              controller: _textZoneController,
              label: 'Your Zone',
              placeholder: 'Type your zone',
            ),
            const SizedBox(height: 8),
            FormInput(
              controller: _textAreaController,
              label: 'Your Area',
              placeholder: 'Type your area',
            ),
            const SizedBox(height: 25),
            CustomButton(
              text: 'Submit',
              action: () {},
              color: AppColors.primary,
            ),
            const SizedBox(height: 25)
          ],
        ),
      ),
    );
  }
}
