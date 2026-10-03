import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../l10n/app_localizations.dart';

/// A digits-only input that validates positive integers and allows empty input.
class PositiveIntegerField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String suffix;

  const PositiveIntegerField({
    super.key,
    required this.controller,
    required this.label,
    required this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        filled: true,
        labelText: label,
        suffixText: suffix,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return null;
        final number = int.tryParse(value);
        return number == null || number <= 0
            ? localizations.enterPositiveWholeNumber
            : null;
      },
    );
  }
}
