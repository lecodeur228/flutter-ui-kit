import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';

import '../../tokens/app_spacing.dart';

/// Champ de formulaire avec validation.
class UiTextFormField extends StatelessWidget {
  const UiTextFormField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.obscureText = false,
    this.enabled = true,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.prefixIcon,
    this.maxLines = 1,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final bool obscureText;
  final bool enabled;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final IconData? prefixIcon;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(label!, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: AppSpacing.xs),
        ],
        AdaptiveTextFormField(
          controller: controller,
          placeholder: hint,
          obscureText: obscureText,
          enabled: enabled,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: onChanged,
          onSaved: onSaved,
          maxLines: maxLines,
          prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
        ),
      ],
    );
  }
}
