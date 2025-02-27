import 'package:flutter/material.dart';
import 'package:flutter_y3_t2/w7-blablacar/theme/theme.dart';

class BlaListTile extends StatelessWidget {
  final VoidCallback onClick;
  final VoidCallback? swapDirection;
  final String text; // to display the text
  final String?
      tileOrder; // to know the position of tile( first or second) to set the icon and traling conditionn on it
  final Icon icon;
  const BlaListTile(
      {super.key,
      required this.onClick,
      required this.text,
      this.tileOrder,
      required this.icon,
      this.swapDirection});

  @override
  Widget build(BuildContext context) {
    if (tileOrder == "first") {
      return Container(
        padding: EdgeInsets.all(16),
        child: ListTile(
          leading: IconTheme(
              data: IconThemeData(
                color: BlaColors.neutralLight,
              ),
              child: icon),
          trailing: IconButton(
              onPressed: swapDirection, icon: Icon(Icons.swap_vert_sharp)),
          title: Text(
            text,
            style: TextStyle(color: BlaColors.neutral),
          ),
          onTap: onClick,
        ),
      );
    }
    return Container(
      padding: EdgeInsets.all(16),
      child: ListTile(
        leading: IconTheme(
            data: IconThemeData(color: BlaColors.neutralLight), child: icon),
        title: Text(text,
            style: TextStyle(
              color: BlaColors.neutral,
            )),
        onTap: onClick,
      ),
    );
  }
}
