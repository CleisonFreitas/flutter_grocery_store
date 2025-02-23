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
  final bool? isPassword;
  final bool? isCircularInput;

  static const UnderlineInputBorder underlineInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.labelColor,
    ),
  );
  static OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide.none,
  );
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
    this.isPassword,
    this.isCircularInput,
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
          cursorColor: (isCircularInput != null && isCircularInput!)
              ? AppColors.darkContext
              : AppColors.labelColor,
          maxLength: maxLength ?? 255,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          obscureText: isPassword ?? false,
          style: AppTexts.label.copyWith(color: AppColors.darkContext),
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.text,
          autofocus: autoFocus ?? false,
          focusNode: focus ?? FocusNode(),
          decoration: InputDecoration(
            counterText: '',
            filled: isCircularInput,
            focusColor: AppColors.labelColor,
            focusedBorder: (isCircularInput != null && isCircularInput!)
                ? FormInput.outlineInputBorder
                : underlineInputBorder,
            border: (isCircularInput != null && isCircularInput!)
                ? FormInput.outlineInputBorder
                : underlineInputBorder,
            labelStyle: AppTexts.label,
            fillColor: AppColors.modalColor,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: icon != null ? Icon(icon) : null,
            prefix: prefix != null
                ? Text(
                    '$prefix ',
                    style: AppTexts.label.copyWith(
                      color: AppColors.labelColor,
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
