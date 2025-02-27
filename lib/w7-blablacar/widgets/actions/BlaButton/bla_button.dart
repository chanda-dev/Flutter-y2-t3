import 'package:flutter/material.dart';
import '/w7-blablacar/theme/theme.dart';

class BlaButton extends StatelessWidget {
  final Icon? icon;
  final VoidCallback onUsed;
  final String type;
  final String text;

  const BlaButton({
    super.key,
    this.icon,
    required this.onUsed,
    required this.type,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    // set condition for primary and secondary button
    if (type == 'PRIMARY') {
      return ElevatedButton.icon(
        onPressed: onUsed,
        label: Text(
          text,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        icon: icon ?? const SizedBox(), // set when button do not contain icon
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(BlaColors.primary),
          foregroundColor: WidgetStateProperty.all(BlaColors.white),
        ),
      );
    }

    // Secondary Button
    return ElevatedButton.icon(
      onPressed: onUsed,
      label: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      icon: icon ?? const SizedBox(), // set when button do not contain icon
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(BlaColors.white),
        foregroundColor: WidgetStateProperty.all(BlaColors.primary),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: BlaColors.greyLight,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
