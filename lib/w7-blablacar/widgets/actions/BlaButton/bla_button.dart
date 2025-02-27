import 'package:flutter/material.dart';
import '/w7-blablacar/theme/theme.dart';

class BlaButton extends StatelessWidget {
  final Icon? icon;
  final VoidCallback onUsed; // to do some action
  final String type; // set to know what type of button ( primary and secondary)
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
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(BlaSpacings.radius),
                    bottomRight: Radius.circular(BlaSpacings.radius))))),
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
            borderRadius: BorderRadius.circular(BlaSpacings.radius),
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
