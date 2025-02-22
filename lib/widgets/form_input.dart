import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nt_app/constants/app_colors.dart';
import 'package:nt_app/constants/app_texts.dart';

class FormInput extends StatelessWidget {
  final TextEditingController controller;
  final IconData? icon;
  final String? prefix;
  final String? iconPath;
  final bool? autoFocus;
  final FocusNode? focus;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool? isNumeric;
  final String? label;
  final String? placeholder;

  const FormInput({
    super.key,
    required this.controller,
    this.icon,
    this.prefix,
    this.autoFocus,
    this.focus,
    this.iconPath,
    this.keyboardType,
    this.maxLength,
    this.isNumeric,
    this.label,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            textAlign: TextAlign.start,
            style: AppTexts.label.copyWith(color: AppColors.labelColor),
          ),
        ],
        TextField(
          cursorColor: AppColors.labelColor,
          maxLength: maxLength ?? 255,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          obscureText: false,
          style: AppTexts.label.copyWith(color: AppColors.labelColor),
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.text,
          autofocus: autoFocus ?? false,
          focusNode: focus ?? FocusNode(),
          decoration: InputDecoration(
            counterText: '',
            focusColor: AppColors.primary,
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primary,
              ),
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primary,
              ),
            ),
            labelStyle: AppTexts.label,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: icon != null ? Icon(icon) : null,
            prefix: prefix != null
                ? Text(
                    '$prefix ',
                    style: AppTexts.label.copyWith(
                      color: AppColors.primary,
                    ),
                  )
                : null,
            hintText: placeholder,
            hintStyle: AppTexts.label.copyWith(color: AppColors.labelColor),
          ),
        ),
      ],
    );
  }
}
