import 'package:flutter/material.dart';
import 'package:nt_app/widgets/form_input.dart';

class FormPasswordInput extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  const FormPasswordInput({super.key, required this.controller, this.label});

  @override
  State<FormPasswordInput> createState() => _FormPasswordInputState();
}

class _FormPasswordInputState extends State<FormPasswordInput> {
  TextEditingController get _controller => widget.controller;
  String? get _label => widget.label;
  bool showPassword = false;

  void _changeView() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormInput(
      controller: _controller,
      label: _label,
      suffixIcon: showPassword ? Icons.visibility_off : Icons.remove_red_eye,
      suffixAction: _changeView,
      isPassword: !showPassword,
    );
  }
}
