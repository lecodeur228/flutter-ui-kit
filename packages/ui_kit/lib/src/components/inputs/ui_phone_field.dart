import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../tokens/app_radius.dart';
import '../../tokens/app_sizes.dart';
import '../../tokens/app_spacing.dart';

export 'package:intl_phone_field/countries.dart' show Country;
export 'package:intl_phone_field/phone_number.dart' show PhoneNumber;

/// Champ téléphone international (données `intl_phone_field`).
/// Le sélecteur de pays s'ouvre en **bottom sheet**.
class UiPhoneField extends StatefulWidget {
  const UiPhoneField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.enabled = true,
    this.onChanged,
    this.onSaved,
    this.onCountryChanged,
    this.initialCountryCode = 'FR',
    this.languageCode = 'fr',
    this.showCountryFlag = true,
    this.favoriteCountryCodes = const ['FR', 'BJ', 'CI', 'SN'],
  });

  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final bool enabled;
  final ValueChanged<PhoneNumber>? onChanged;
  final FormFieldSetter<PhoneNumber>? onSaved;
  final ValueChanged<Country>? onCountryChanged;
  final String initialCountryCode;
  final String languageCode;
  final bool showCountryFlag;
  final List<String> favoriteCountryCodes;

  @override
  State<UiPhoneField> createState() => _UiPhoneFieldState();
}

class _UiPhoneFieldState extends State<UiPhoneField> {
  late Country _country;
  late TextEditingController _controller;
  var _ownsController = false;

  @override
  void initState() {
    super.initState();
    _country = countries.firstWhere(
      (c) => c.code == widget.initialCountryCode.toUpperCase(),
      orElse: () => countries.firstWhere((c) => c.code == 'FR'),
    );
    if (widget.controller != null) {
      _controller = widget.controller!;
    } else {
      _controller = TextEditingController();
      _ownsController = true;
    }
    _controller.addListener(_emitChange);
  }

  @override
  void dispose() {
    _controller.removeListener(_emitChange);
    if (_ownsController) _controller.dispose();
    super.dispose();
  }

  PhoneNumber get _phone => PhoneNumber(
        countryISOCode: _country.code,
        countryCode: '+${_country.fullCountryCode}',
        number: _controller.text,
      );

  void _emitChange() => widget.onChanged?.call(_phone);

  Future<void> _openCountrySheet() async {
    if (!widget.enabled) return;

    final selected = await showModalBottomSheet<Country>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg)),
      ),
      builder: (context) {
        return _CountryPickerSheet(
          languageCode: widget.languageCode,
          selected: _country,
          favorites: widget.favoriteCountryCodes,
        );
      },
    );

    if (selected != null && mounted) {
      setState(() => _country = selected);
      widget.onCountryChanged?.call(selected);
      _emitChange();
    }
  }

  String? _validate(String? value) {
    final number = value?.trim() ?? '';
    if (number.isEmpty) return 'Numéro requis';
    if (number.length < _country.minLength) return 'Numéro trop court';
    if (number.length > _country.maxLength) return 'Numéro trop long';
    return null;
  }

  Widget _flag(Country country, {double size = 22}) {
    if (!widget.showCountryFlag) return const SizedBox.shrink();
    if (kIsWeb) {
      return Image.asset(
        'assets/flags/${country.code.toLowerCase()}.png',
        package: 'intl_phone_field',
        width: size,
      );
    }
    return Text(country.flag, style: TextStyle(fontSize: size));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(widget.label!, style: theme.textTheme.labelLarge),
          const SizedBox(height: AppSpacing.xs),
        ],
        TextFormField(
          controller: _controller,
          enabled: widget.enabled,
          keyboardType: TextInputType.phone,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: _validate,
          onSaved: (_) => widget.onSaved?.call(_phone),
          decoration: InputDecoration(
            hintText: widget.hint ?? '6 12 34 56 78',
            filled: true,
            fillColor: colors.surface,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
            prefixIcon: InkWell(
              onTap: _openCountrySheet,
              borderRadius: AppRadius.buttonAll,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _flag(_country),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      '+${_country.dialCode}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      LucideIcons.chevronDown,
                      size: AppSizes.iconSm,
                      color: colors.onSurfaceVariant,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Container(
                      width: 1,
                      height: 24,
                      color: colors.outlineVariant,
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: AppRadius.inputAll,
              borderSide: BorderSide(color: colors.outline),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: AppRadius.inputAll,
              borderSide: BorderSide(color: colors.outline),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: AppRadius.inputAll,
              borderSide: BorderSide(color: colors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: AppRadius.inputAll,
              borderSide: BorderSide(color: colors.error),
            ),
          ),
        ),
      ],
    );
  }
}

class _CountryPickerSheet extends StatefulWidget {
  const _CountryPickerSheet({
    required this.languageCode,
    required this.selected,
    required this.favorites,
  });

  final String languageCode;
  final Country selected;
  final List<String> favorites;

  @override
  State<_CountryPickerSheet> createState() => _CountryPickerSheetState();
}

class _CountryPickerSheetState extends State<_CountryPickerSheet> {
  late List<Country> _filtered;
  final _query = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filtered = _sorted(countries);
  }

  @override
  void dispose() {
    _query.dispose();
    super.dispose();
  }

  List<Country> _sorted(List<Country> list) {
    final favCodes = widget.favorites.map((e) => e.toUpperCase()).toSet();
    final favs = <Country>[];
    final others = <Country>[];
    for (final c in list) {
      if (favCodes.contains(c.code)) {
        favs.add(c);
      } else {
        others.add(c);
      }
    }
    others.sort(
      (a, b) => a
          .localizedName(widget.languageCode)
          .compareTo(b.localizedName(widget.languageCode)),
    );
    favs.sort(
      (a, b) => widget.favorites
          .indexOf(a.code)
          .compareTo(widget.favorites.indexOf(b.code)),
    );
    return [...favs, ...others];
  }

  void _onSearch(String value) {
    setState(() {
      final base = value.trim().isEmpty
          ? countries
          : countries.stringSearch(value);
      _filtered = _sorted(base);
    });
  }

  Widget _flag(Country country) {
    if (kIsWeb) {
      return Image.asset(
        'assets/flags/${country.code.toLowerCase()}.png',
        package: 'intl_phone_field',
        width: 28,
      );
    }
    return Text(country.flag, style: const TextStyle(fontSize: 22));
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final height = MediaQuery.sizeOf(context).height * 0.85;

    return SizedBox(
      height: height,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.page,
              AppSpacing.sm,
              AppSpacing.page,
              AppSpacing.md,
            ),
            child: TextField(
              controller: _query,
              onChanged: _onSearch,
              decoration: InputDecoration(
                hintText: 'Rechercher un pays',
                prefixIcon: const Icon(LucideIcons.search),
                filled: true,
                fillColor: colors.surfaceContainerHighest.withValues(alpha: 0.5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  borderSide: BorderSide(color: colors.primary, width: 2),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: _filtered.length,
              separatorBuilder: (context, index) => Divider(
                height: 1,
                indent: AppSpacing.page,
                color: colors.outlineVariant,
              ),
              itemBuilder: (context, index) {
                final country = _filtered[index];
                final selected = country.code == widget.selected.code;
                return ListTile(
                  selected: selected,
                  leading: _flag(country),
                  title: Text(country.localizedName(widget.languageCode)),
                  trailing: Text(
                    '+${country.dialCode}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                  onTap: () => Navigator.of(context).pop(country),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
