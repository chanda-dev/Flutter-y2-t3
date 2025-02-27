import 'package:flutter/material.dart';
import 'package:flutter_y3_t2/w7-blablacar/theme/theme.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback goBack;
  final VoidCallback clearSearch;
  final bool hasText;
  const SearchField(
      {super.key,
      required this.goBack,
      required this.clearSearch,
      required this.controller,
      required this.hasText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BlaSpacings.radius),
          color: BlaColors.backgroundAccent),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: 'Station Road or The Bridge Cafe',
            contentPadding: EdgeInsets.symmetric(vertical: 15),
            hintStyle: TextStyle(color: BlaColors.neutralLighter),
            prefixIcon:
                IconButton(onPressed: goBack, icon: Icon(Icons.arrow_back)),
            prefixIconColor: BlaColors.neutralLighter,
            suffixIcon: hasText
                ? (IconButton(onPressed: clearSearch, icon: Icon(Icons.clear)))
                : null,
            suffixIconColor: BlaColors.neutralLighter,
            border: InputBorder.none),
      ),
    );
  }
}
