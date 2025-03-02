import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_colors.dart';
import 'package:nt_app/constants/app_texts.dart';
import 'package:nt_app/screens/login_screen.dart';
import 'package:nt_app/widgets/content_container.dart';
import 'package:nt_app/widgets/form_input.dart';
import 'package:nt_app/widgets/go_back_button.dart';
import 'package:nt_app/widgets/requisition_modal.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final _zipCodeController = TextEditingController();
  final _addressController = TextEditingController();
  final _addressNumberController = TextEditingController();
  final _neighborHoodController = TextEditingController();
  final _cityController = TextEditingController();
  final _complementController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _addressController.dispose();
    _addressNumberController.dispose();
    _cityController.dispose();
    _neighborHoodController.dispose();
    _zipCodeController.dispose();
    _complementController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const GoBackButton(),
            const SizedBox(height: 30),
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
            Expanded(
              child: Flex(
                direction: Axis.vertical,
                spacing: 20,
                children: <Widget>[
                  FormInput(
                    controller: _zipCodeController,
                    placeholder: 'Only numbers',
                    autoFocus: true,
                    isNumeric: true,
                    keyboardType: TextInputType.number,
                    maxLength: 8,
                    label: 'Zip code',
                    icon: Icons.maps_home_work,
                  ),
                  RequisitionModal(
                    modalName: 'Submit',
                    action: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    ),
                    colorButton: AppColors.primary,
                    content: SingleChildScrollView(
                      child: Flex(
                        direction: Axis.vertical,
                        spacing: 10,
                        children: <Widget>[
                          FormInput(
                            controller: _zipCodeController,
                            icon: Icons.maps_home_work,
                            label: 'Zip code',
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              direction: Axis.horizontal,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: FormInput(
                                    controller: _addressController,
                                    icon: Icons.streetview,
                                    label: 'Adress',
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: FormInput(
                                    controller: _addressNumberController,
                                    icon: Icons.numbers_rounded,
                                    label: 'Number',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          FormInput(
                            controller: _complementController,
                            icon: Icons.comment,
                            label: 'Complement',
                          ),
                          FormInput(
                            controller: _neighborHoodController,
                            icon: Icons.map_outlined,
                            label: 'Neighborhood',
                          ),
                          FormInput(
                            controller: _cityController,
                            icon: Icons.location_city_sharp,
                            label: 'City',
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
