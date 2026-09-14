import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../tokens/app_spacing.dart';
import 'ui_input_decoration.dart';

/// Champ de formulaire Journey avec validation.
class UiTextFormField extends StatelessWidget {
  const UiTextFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.label,
    this.hint,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.autofillHints,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.autovalidateMode,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hint;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onFieldSubmitted;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: enabled ? scheme.onSurface : scheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: AppSpacing.xs),
        ],
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          obscureText: obscureText,
          enabled: enabled,
          readOnly: readOnly,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          validator: validator,
          onChanged: onChanged,
          onSaved: onSaved,
          onFieldSubmitted: onFieldSubmitted,
          maxLines: obscureText ? 1 : maxLines,
          minLines: minLines,
          maxLength: maxLength,
          autofillHints: autofillHints,
          inputFormatters: inputFormatters,
          textCapitalization: textCapitalization,
          autovalidateMode: autovalidateMode,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: enabled ? scheme.onSurface : scheme.onSurfaceVariant,
              ),
          cursorColor: scheme.primary,
          decoration: UiInputDecoration.of(
            context,
            hint: hint,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            enabled: enabled,
          ),
        ),
      ],
    );
  }
}
