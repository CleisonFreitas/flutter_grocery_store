import 'package:flutter/material.dart';
import 'package:nt_app/constants/app_colors.dart';
import 'package:nt_app/constants/app_texts.dart';

class PersonalAccordion extends StatefulWidget {
  final String title;
  final String description;

  const PersonalAccordion({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  State<PersonalAccordion> createState() => _PersonalAccordionState();
}

class _PersonalAccordionState extends State<PersonalAccordion> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          title: Text(
            widget.title,
            style: AppTexts.label.copyWith(
              color: AppColors.darkContext,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Icon(
            _isExpanded
                ? Icons.keyboard_arrow_down
                : Icons.keyboard_arrow_right,
          ),
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
        ),
        if (_isExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 5,
            ),
            child: Text(widget.description),
          )
      ],
    );
  }
}
