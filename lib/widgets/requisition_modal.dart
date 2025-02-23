import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_colors.dart';
import 'package:nt_app/constants/app_texts.dart';
import 'package:nt_app/widgets/custom_button.dart';

class RequisitionModal extends StatelessWidget {
  final String modalName;
  final Color colorButton;
  final Widget content;
  final VoidCallback? action;

  const RequisitionModal({
    super.key,
    required this.modalName,
    required this.colorButton,
    required this.content,
    this.action,
  });

  Future<dynamic> showModalBody(BuildContext context, Widget content) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
            ),
            title: const Text(
              'Checking data',
              style: AppTexts.label,
            ),
            centerTitle: true,
            backgroundColor: AppColors.main,
          ),
          body: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 1,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                Expanded(child: content),
                CustomButton(
                  text: 'Confirm',
                  action: action ?? () {},
                  color: AppColors.primary,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: modalName,
      action: () => showModalBody(context, content),
      color: colorButton,
    );
  }
}
